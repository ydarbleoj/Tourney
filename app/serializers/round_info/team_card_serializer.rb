module RoundInfo
  class TeamCardSerializer
    include FastJsonapi::ObjectSerializer
    set_type :team
    set_id :id

    has_many :user_scores, serializer: UserScoreSerializer
    has_one :new_course, serializer: NewCourseSerializer
    has_many :holes, through: :new_course, serializer: HoleSerializer
    has_many :team_scores
    has_many :team_cards
    has_many :scorecards, through: :team_cards

    attributes :new_course_id, :tournament_round_id, :total_net, :is_won, :group

    attribute :out_net do |obj|
      obj.team_scores.select { |x| x if x.number < 10 }.map { |xx| xx.net }.inject(0) { |sum, i| sum + i }
    end

    attribute :in_net do |obj|
      obj.team_scores.select { |x| x if x.number > 9 }.map { |xx| xx.net }.inject(0) { |sum, i| sum + i }
    end

    attribute :out_gross do |obj|
      objects = obj.team_scores.select { |x| x if x.number < 10 }
      objects.map do |xx|
        one = xx.score_1
        two = xx.score_2
        one_score = one ? one.score : 0
        two_score = two ? two.score : 0

        one_score + two_score
      end.inject(0) { |sum, i| sum + i }
    end

    attribute :in_gross do |obj|
      objects = obj.team_scores.select { |x| x if x.number > 9 }
      objects.map do |xx|
        one = xx.score_1
        two = xx.score_2
        one_score = one ? one.score : 0
        two_score = two ? two.score : 0

        one_score + two_score
      end.inject(0) { |sum, i| sum + i }
    end

    attribute :out_putts do |obj|
      objects = obj.team_scores.select { |x| x if x.number < 10 }
      objects.map do |xx|
        one = xx.score_1
        two = xx.score_2
        one_putts = one ? one.putts : 0
        two_putts = two ? two.putts : 0

        one_putts + two_putts
      end.inject(0) { |sum, i| sum + i }
    end

    attribute :in_putts do |obj|
      objects = obj.team_scores.select { |x| x if x.number > 9 }
      objects.map do |xx|
        one = xx.score_1
        two = xx.score_2
        one_putts = one ? one.putts : 0
        two_putts = two ? two.putts : 0

        one_putts + two_putts
      end.inject(0) { |sum, i| sum + i }
    end

    attribute :gross do |obj|
      obj.team_scores.map do |team_score|
        one = team_score.score_1
        two = team_score.score_2
        one_score = one ? one.score : 0
        two_score = two ? two.score : 0

        one_score + two_score
      end.inject(0) { |sum, i| sum + i }
    end

    attribute :in_3putts do |obj|
      nil
    end
    attribute :out_3putts do |obj|
      # obj.user_scores.select { |x| x if x.number < 10 && x.putts > 2 }.map(&:id).length
      nil
    end

    attribute :course_name do |object|
      object.new_course.name
    end

    attribute :course_par do |object|
      object.new_course.par
    end

    attributes :holes do |object|
      holes = object.new_course.holes.sort_by(&:number)
      scores = object.team_scores.sort_by(&:number)

      [holes, scores].flatten.group_by { |x| x.number }.map do |num, arr|
        hole = arr.select { |x| x if x.is_a?(Hole) }.map {|xx| xx}[0]
        score = arr.select { |x| x if x.is_a?(TeamScore) }.map {|xx| xx}[0]

        putt1 = score.blank? ? 0 : score.score_1&.putts
        putt2 = score.blank? ? 0 : score.score_2&.putts
        score1 = score.blank? ? 0 : score.score1
        score2 = score.blank? ? 0 : score.score2

        {
          number: num,
          par: hole.par,
          handicap: hole.handicap,
          score: (score1.to_i + score2.to_i),
          net: score.blank? ? 0 : score.net,
          putts: (putt1.to_i + putt2.to_i),
          hole_id: hole.id,
          score_1_id: score&.score_1_id,
          score_2_id: score&.score_2_id
        }
      end
    end
  end
end
