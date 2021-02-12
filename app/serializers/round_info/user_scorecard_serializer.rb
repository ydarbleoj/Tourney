module RoundInfo
  class UserScorecardSerializer
    include FastJsonapi::ObjectSerializer
    set_type :scorecard
    set_id :id

    has_many :user_scores, serializer: UserScoreSerializer
    has_one :new_course, serializer: NewCourseSerializer
    has_many :holes, through: :new_course, serializer: HoleSerializer

    attributes :total_score, :total_putts, :total_3putts, :new_course_id, :user_id, :tournament_round_id,
      :total_net, :round_num, :handicap, :finished, :id

    attribute :out_net do |obj|
      obj.user_scores.select { |x| x if x.number < 10 }.map { |xx| xx.net }.inject(0) { |sum, i| sum + i }
    end

    attribute :in_net do |obj|
      obj.user_scores.select { |x| x if x.number > 9 }.map { |xx| xx.net }.inject(0) { |sum, i| sum + i }
    end

    attribute :out_gross do |obj|
      obj.user_scores.select { |x| x if x.number < 10 }.map { |xx| xx.score }.inject(0) { |sum, i| sum + i }
    end

    attribute :in_gross do |obj|
      obj.user_scores.select { |x| x if x.number > 9 }.map { |xx| xx.score }.inject(0) { |sum, i| sum + i }
    end

    attribute :out_putts do |obj|
      obj.user_scores.select { |x| x if x.number < 10 }.map(&:putts).inject(0) { |sum, i| sum + i }
    end

    attribute :in_putts do |obj|
      obj.user_scores.select { |x| x if x.number > 9 }.map(&:putts).inject(0) { |sum, i| sum + i }
    end

    attribute :in_3putts do |obj|
      obj.user_scores.select { |x| x if x.number > 9 && x.putts > 2 }.map(&:id).length
    end
    attribute :out_3putts do |obj|
      obj.user_scores.select { |x| x if x.number < 10 && x.putts > 2 }.map(&:id).length
    end

    attribute :course_name do |object|
      object.new_course.name
    end

    attribute :player_name do |object|
      "#{object.user.first_name} #{object.user.last_name}"
    end

    attributes :holes do |object|
      holes = object.new_course.holes.sort_by(&:number)
      scores = object.user_scores.sort_by(&:number)

      [holes, scores].flatten.group_by { |x| x.number }.map do |num, arr|
        hole = arr.select { |x| x if x.is_a?(Hole) }.map {|xx| xx}[0]
        score = arr.select { |x| x if x.is_a?(UserScore) }.map {|xx| xx}[0]
        {
          number: num,
          par: hole.par,
          handicap: hole.handicap,
          score: score.blank? ? nil : score.score,
          net: score.blank? ? nil : score.net,
          putts: score.blank? ? nil : score.putts,
          hole_id: hole.id,
          user_score_id: score.blank? ? nil : score.id
        }
      end
    end
  end
end
