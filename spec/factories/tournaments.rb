FactoryGirl.define do
  factory :tournament do
    name 'Bandon'
    year 2017
    start_date { DateTime.new(year, 2, 8) }
    end_date { DateTime.new(year, 2, 10) }
    num_players 16
    num_rounds 3
  end

  trait :setup do
    after :create do |tourn|
      courses = NewCourse.first(tourn.num_rounds)
      users = FactoryGirl.create_list(:user, tourn.num_players)
      admin_user = users[0]
      tourn.tournament_users.create(user_id: admin_user.id, role: 'admin')

      users.each do |user|
        unless user.id == admin_user.id
          tourn.users << user
        end
      end

      rnd = 0
      tourn.num_rounds.times do
        rnd += 1
        dd = rnd - 1
        add_date = tourn.start_date + dd.day

        tournament_round = tourn.tournament_rounds.create(round_number: rnd, round_date: add_date, tee_time_date: add_date, new_course_id: courses[dd].id)
        tourn.tournament_new_courses.create(new_course_id: courses[dd].id, round_num: rnd)

        users.each do |user|
          FactoryGirl.create(:scorecard, :with_scores, user_id: user.id, tournament_round_id: tournament_round.id, round_num: rnd, handicap: user.handicap, new_course_id: courses[dd].id)
        end
      end
    end
  end

end
