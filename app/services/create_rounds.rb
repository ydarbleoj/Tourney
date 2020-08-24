class CreateRounds

  def self.call(tournament, params, current_user)
    new(tournament, params, current_user).call
  end

  def initialize(tournament, params, current_user)
    @tournament = tournament
    @params     = params.sort_by { |x| x['round_number'] }
    @current_user = current_user
  end

  def call
    ActiveRecord::Base.transaction do
      build_rounds
      add_admin_user
    end
    true
  rescue StandardError => e
    p " error #{e}"
    false
  end

  private
  def build_rounds
    @params.each do |round|
      t_round = create_round(round)
      build_teams(t_round, round)
    end
  end

  def build_teams(t_round, round)
    groups(round['tee_times']).each do |group|
      create_team(t_round.id, t_round.new_course_id, group, round['round_date'])
    end
  end

  def add_admin_user
    PlayerBuild.call(@tournament, @current_user, 'admin')
  end

  def groups(group)
    ['groupA', 'groupB', 'groupC', 'groupD'].map {|x| [x, group[0][x]] }
  end

  def parse_group_time(round_date, group)
    y, m, d = round_date.split('T')[0].split('-').map { |x| x.to_i }
    h, min = group.blank? ? [0, 0] : group.split(':').map { |x| x.to_i }
    DateTime.new(y, m, d, h, min)
  end

  def create_round(round)
    TournamentRound.create!(
      tournament_id: @tournament.id,
      round_number: round["round_number"],
      round_date: parse_group_time(round["round_date"], nil),
      new_course_id: round["course"].to_i,
    )
  end

  def create_team(tr_id, course_id, group, round_date)
    TeamScorecard.create!(
      tournament_round_id: tr_id,
      new_course_id: course_id,
      group: group[0],
      group_time: parse_group_time(round_date, group[1])
    )
  end
end