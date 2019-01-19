module Admins
  class ScorecardsWithHolesSerializer
    include FastJsonapi::ObjectSerializer
    set_type :scorecard
    set_id :id

    has_many :user_scores, serializer: UserScoreSerializer
    has_one :new_course, serializer: NewCourseSerializer
    has_many :holes, through: :new_course, serializer: HoleSerializer

    attributes :total_score, :total_putts, :total_3putts, :new_course_id, :user_id, :tournament_round_id,
      :total_net, :round_num, :handicap, :finished

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

    attributes :holes do |object|
      holes = object.new_course.holes.sort_by(&:number)
      scores = object.user_scores.sort_by(&:number)

      (0..17).map do |num|
        {
          number: (num + 1),
          par: holes[num].par,
          handicap: holes[num].handicap,
          score: scores[num].blank? ? nil : scores[num].score,
          net: scores[num].blank? ? nil : scores[num].net,
          putts: scores[num].blank? ? nil : scores[num].putts,
          hole_id: holes[num].id,
          user_score_id: scores[num].blank? ? nil : scores[num].id
        }
      end

    end

  end
end