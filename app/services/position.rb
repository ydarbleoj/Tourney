class Position

  def self.setter(objects, field)
    new(objects, field).call
  end

  def self.skins_setter(objects, field)
    new(objects, field).skins_setter
  end

  def initialize(objects, field)
   p @objects = objects.sort_by { |x| x.send(field) }
    @field   = field.to_sym
  end

  def skins_setter
    return false if @objects.blank?
    total_skins
    grouped = group_skins
    set_position(grouped)
  rescue StandardError => e
    p "error #{e}"
  end

  def call
    return false if @objects.blank?
    grouped = @objects.group_by { |x| x[@field] }.map { |x| x[1] }
    set_position(grouped)
  rescue StandardError => e
    p "error #{e}"
  end

  private
  attr_reader :skins

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
      total = lb.scorecards.map { |x| x.net_skin_total }.reduce(:+)
      lb.total_skins = total
    end
  end

  def group_skins
    skins = @objects.sort_by { |x| x.total_skins }.reverse.map { |x| x }
    skins.group_by { |x| x.total_skins }.map { |x| x[1] }
  end
end