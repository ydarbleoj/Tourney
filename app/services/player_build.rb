class PlayerBuild

  def self.call(tournament, user, role)
    new(tournament, user, role).call
  end

  def initialize(tournament, user, role)
    @tournament = tournament
    @user       = user
    @rounds     = tournament.tournament_rounds.sort_by(&:round_number)
    @role       = role
  end

  def call
    ActiveRecord::Base.transaction do
      add_user
      build_leaderboard
      build_scorecards
      build_money
    end
    true
  rescue StandardError => e
    p "error #{e}"
    false
  end

  private
  def add_user
    TournamentUser.create(tournament_id: @tournament.id, user_id: @user.id, role: @role)
  end

  def build_leaderboard
    @leaderboard = Leaderboard.create(tournament_id: @tournament.id, user_id: @user.id)
  end

  def build_scorecards
    @rounds.each do |round|
      Scorecard.create(user_id: @user.id, round_num: round.round_number, new_course_id: round.new_course_id, tournament_round_id: round.id,
        total_score: 0, total_putts: 0, total_3putts: 0, total_net: 0, leaderboard_id: @leaderboard.id)
    end
  end

  def build_money
    SkinsMoney.create(user_id: @user.id, tournament_id: @tournament.id, leaderboard_id: @leaderboard.id)
    PuttingMoney.create(user_id: @user.id, tournament_id: @tournament.id)
    StrokeMoney.create(user_id: @user.id, tournament_id: @tournament.id)
    TeamMoney.create(user_id: @user.id, tournament_id: @tournament.id)
  end

end