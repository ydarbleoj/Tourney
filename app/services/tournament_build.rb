class TournamentBuild
  def initialize(name, emails)
    @tournament = Tournament.create(
      name: 'Bandon', year: 2018, num_players: 15,
      num_rounds: 3, start_date: DateTime.new(2018, 2, 9).beginning_of_day, end_date: DateTime.new(2018, 2, 11).end_of_day)
    @emails = emails
  end

  def execute
    build_rounds
    build_users
    build_leaderboard
    build_round_cards
    build_money_lists
    build_team_cards
  end

  def find_emails
    @users = User.where(email: @emails)
  end

  def build_rounds
    @round_one = TournamentRound.create(tournament_id: @tournament.id, round_number: 1, round_date: DateTime.new(2018, 2, 9).beginning_of_day, new_course_id: 2)
    @round_two = TournamentRound.create(tournament_id: @tournament.id, round_number: 2, round_date: DateTime.new(2018, 2, 10).beginning_of_day, new_course_id: 4)
    @round_three = TournamentRound.create(tournament_id: @tournament.id, round_number: 3, round_date: DateTime.new(2018, 2, 11).beginning_of_day, new_course_id: 3)
  end

  def build_users
    @users = User.where(email: @emails)
    @users.each do |user|
      @tournament.users << user
    end
  end

  def build_leaderboard
    @users.each do |user|
      Leaderboard.create(tournament_id: @tournament.id, user_id: user.id)
    end
  end

  def build_round_cards
    build_scorecards(@round_one)
    build_scorecards(@round_two)
    build_scorecards(@round_three)
  end

  def build_scorecards(rnd)
    @users.each do |user|
      Scorecard.create(user_id: user.id, round_num: rnd.round_number, new_course_id: rnd.new_course_id, tournament_round_id: rnd.id,
        total_score: 0, total_putts: 0, total_3putts: 0, total_net: 0)
    end
  end

  def build_money_lists
    @users.each do |user|
      SkinsMoney.create(user_id: user.id, tournament_id: @tournament.id)
      PuttingMoney.create(user_id: user.id, tournament_id: @tournament.id)
      StrokeMoney.create(user_id: user.id, tournament_id: @tournament.id)
      TeamMoney.create(user_id: user.id, tournament_id: @tournament.id)
    end
  end

  def build_team_cards
    round_one_team
    round_two_team
    round_three_team
  end

  def round_one_team
    rnd = @round_one
    Team.create(group: 'Group A', new_course_id: rnd.new_course_id, tournament_round_id: rnd.id, group_time: DateTime.new(2018, 2, 9, 11, 00))
    Team.create(group: 'Group B', new_course_id: rnd.new_course_id, tournament_round_id: rnd.id, group_time: DateTime.new(2018, 2, 9, 11, 20))
    Team.create(group: 'Group C', new_course_id: rnd.new_course_id, tournament_round_id: rnd.id, group_time: DateTime.new(2018, 2, 9, 11, 30))
    Team.create(group: 'Group D', new_course_id: rnd.new_course_id, tournament_round_id: rnd.id, group_time: DateTime.new(2018, 2, 9, 11, 40))
  end

  def round_two_team
    rnd = @round_two
    Team.create(group: 'Group A', new_course_id: rnd.new_course_id, tournament_round_id: rnd.id, group_time: DateTime.new(2018, 2, 10, 10, 20))
    Team.create(group: 'Group B', new_course_id: rnd.new_course_id, tournament_round_id: rnd.id, group_time: DateTime.new(2018, 2, 10, 10, 30))
    Team.create(group: 'Group C', new_course_id: rnd.new_course_id, tournament_round_id: rnd.id, group_time: DateTime.new(2018, 2, 10, 10, 40))
    Team.create(group: 'Group D', new_course_id: rnd.new_course_id, tournament_round_id: rnd.id, group_time: DateTime.new(2018, 2, 10, 10, 50))
  end

  def round_three_team
    rnd = @round_three
    Team.create(group: 'Group A', new_course_id: rnd.new_course_id, tournament_round_id: rnd.id, group_time: DateTime.new(2018, 2, 11, 9, 50))
    Team.create(group: 'Group B', new_course_id: rnd.new_course_id, tournament_round_id: rnd.id, group_time: DateTime.new(2018, 2, 11, 10, 00))
    Team.create(group: 'Group C', new_course_id: rnd.new_course_id, tournament_round_id: rnd.id, group_time: DateTime.new(2018, 2, 11, 10, 10))
    Team.create(group: 'Group D', new_course_id: rnd.new_course_id, tournament_round_id: rnd.id, group_time: DateTime.new(2018, 2, 11, 10, 20))
  end



end