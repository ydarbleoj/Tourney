FactoryGirl.define do
  factory :tournament do
    name { "Bandon#{rand(1..99)}"}
    year { [2016, 2017, 2015, 2018].sample }
    start_date { DateTime.new(year, 2, 8) }
    end_date { DateTime.new(year, 2, 10) }
    num_players 16
    num_rounds 3
  end

  trait :setup do
    after :create do |tourn|
      courses = NewCourse.last(tourn.num_rounds)
      users = User.first(16)
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
          if rnd == 1
            groups = ['Group A', 'Group B', 'Group C', 'Group D']
            min = [10, 20, 30, 40]
          elsif rnd == 2
             groups = ['Group B', 'Group C', 'Group D', 'Group A']
            min = [20, 30, 40, 10]
          else
            groups = ['Group C', 'Group D', 'Group A', 'Group B',]
            min = [30, 40, 10, 20,]
          end

          user.each do |x|
            FactoryGirl.create(:tee_time, group: groups[i], tournament_round_id: tournament_round.id, user_id: x.id, tee_time: DateTime.new(add_date.year, add_date.month, add_date.day) + 10.hours + min[i].minutes)
          end

        end

        users.each do |user|
          scorecard = FactoryGirl.create(:scorecard, :with_scores, user_id: user.id, tournament_round_id: tournament_round.id, round_num: rnd, handicap: user.handicap, new_course_id: courses[dd].id)

          if rnd == 1
            LeaderboardLogic.new(scorecard).execute
          elsif rnd == 2
            LeaderboardLogic.new(scorecard).execute
          elsif rnd == 3
            LeaderboardLogic.new(scorecard).execute
          end
        end



      end
    end
  end

end
