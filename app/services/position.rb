class Position

  def self.setter(objects, field)
    new(objects, field).call
  end

  def self.skins_setter(objects, field)
    new(objects, field).skins_setter
  end

  def initialize(objects, field)
    @objects     = objects
    @field       = field.to_sym
  end

  def skins_setter
    return false if @objects.blank?
    total_skins
    grouped = group_skins
    ordered_scores = set_position(grouped)
  rescue StandardError => e
    p "error #{e}"
  end

  def call
    return false if @objects.blank?
    group_dnf
    grouped = group_by_field
    p grouped.each { |x| p x }
    ordered_scores = set_position(grouped)
    ordered_scores.push(dnfs)
  rescue StandardError => e
    p "error #{e}"
  end

  private
  attr_reader :skins, :dnfs, :valid_group
  def group_dnf
    if @objects[0].instance_of? TeamScorecard
      @valid_group = @objects
      return
    end

    g = @objects.group_by { |x| x.dnf }.map { |x| x }
    g.each do |x|
      if x[0] == true
        @dnfs = x[1].map { |x| x.position = 99 }
      else
        @valid_group = x[1]
      end
    end
  end

  def group_by_field
    @valid_group.sort_by { |x| x.send(@field) }.group_by { |x| x[@field] }
      .map { |x| x[1] }
  end

  def set_position(groups)
    pos = 0
    groups.each do |x|
      pos = pos == 0 ? 1 : pos
      if x.size > 1
        x.map { |lb| lb.position = pos }
      else
        x.first.position = pos
      end
      pos += x.size
    end
  end

  def total_skins
    @objects.each do |lb|
      total = lb.scorecards.map { |x| x.net_skin_total if x.net_skin_total.present? }.compact.reduce(:+)
      lb.total_skins = total ||= 0
    end
  end

  def group_skins
    skins = @objects.sort_by { |x| x.total_skins }.reverse.map { |x| x }
    skins.group_by { |x| x.total_skins }.map { |x| x[1] }
  end
end