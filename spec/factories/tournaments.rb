FactoryGirl.define do
  factory :tournament do
    name 'Bandon'
    year 2016
    start_date { DateTime.new(year, 2, 8) }
    end_date { DateTime.new(year, 2, 10) }
    num_players 16
    num_rounds 3
  end

  trait :setup do
    after :create do |tourn|
      courses = NewCourse.last(tourn.num_rounds)
      users = User.all
      admin_user = users[0]
      admin_user.leaderboards.create(tournament_id: tourn.id)
      tourn.tournament_users.create(user_id: admin_user.id, role: 'admin')

      users.each do |user|
        unless user.id == admin_user.id
          tourn.users << user
          user.leaderboards.create(tournament_id: tourn.id)
        end
      end

      rnd = 0
      tourn.num_rounds.times do
        rnd += 1
        dd = rnd - 1
        add_date = tourn.start_date + dd.day

        tournament_round = tourn.tournament_rounds.create(round_number: rnd, round_date: add_date, tee_time_date: add_date, new_course_id: courses[dd].id)
        tourn.tournament_new_courses.create(new_course_id: courses[dd].id, round_num: rnd)

        users.each_slice(4).with_index do |user, i|
          groups = ['Group A', 'Group B', 'Group C', 'Group D']
          min = [10, 20, 30, 40]
          FactoryGirl.create(:round_tee_time, group: groups[i], player_one: user[0].username, player_two: user[1].username, player_three: user[2].username, player_four: user[3].username, tournament_round_id: tournament_round.id, tee_time: DateTime.new(add_date.year, add_date.month, add_date.day) + 10.hours + min[i].minutes)

        end

        users.each do |user|
          scorecard = FactoryGirl.create(:scorecard, :with_scores, user_id: user.id, tournament_round_id: tournament_round.id, round_num: rnd, handicap: user.handicap, new_course_id: courses[dd].id)

          if rnd == 1
            LeaderboardLogic.new(tourn, scorecard, user).round_one
          elsif rnd == 2
            LeaderboardLogic.new(tourn, scorecard, user).round_two
          else
            LeaderboardLogic.new(tourn, scorecard, user).round_three
          end
        end



      end
    end
  end

end
