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
      obj.user_scores.select { |x| x if x.number > 9 }.map { |xx| xx.net }.inject(0) { |sum, i| sum + i }
    end

    attribute :out_gross do |obj|
      nil
    end

    attribute :in_gross do |obj|
      nil
    end

    attribute :out_putts do |obj|
      # obj.user_scores.select { |x| x if x.number < 10 }.map(&:putts).inject(0) { |sum, i| sum + i }
      nil
    end

    attribute :in_putts do |obj|
      nil
      # obj.user_scores.select { |x| x if x.number > 9 }.map(&:putts).inject(0) { |sum, i| sum + i }
    end

    attribute :in_3putts do |obj|
      nil
    end
    attribute :out_3putts do |obj|
      nil
      # obj.user_scores.select { |x| x if x.number < 10 && x.putts > 2 }.map(&:id).length
    end

    attribute :course_name do |object|
      object.new_course.name
    end

    attribute :course_par do |object|
      object.new_course.par
    end

    attributes :players do |object|
      object.scorecards.map do |scorecard|
        {
          first_name:   scorecard.user.first_name,
          last_name:    scorecard.user.last_name,
          scorecard_id: scorecard.id,
          user_id:      scorecard.user.id,
          handicap:     scorecard.handicap,
          position:     scorecard.team_card.position
        }
      end
    end

    attributes :holes do |object|
      holes = object.new_course.holes.sort_by(&:number)
      scores = object.team_scores.sort_by(&:number)

      [holes, scores].flatten.group_by { |x| x.number }.map do |num, arr|
        hole = arr.select { |x| x if x.is_a?(Hole) }.map {|xx| xx}[0]
        score = arr.select { |x| x if x.is_a?(TeamScore) }.map {|xx| xx}[0]

        {
          number: num,
          par: hole.par,
          handicap: hole.handicap,
          score: nil,
          net: score.blank? ? 0 : score.net,
          putts: nil,
          hole_id: hole.id,
          score_1_id: score&.score_1_id,
          score_2_id: score&.score_2_id
        }
      end
    end
  end
end
