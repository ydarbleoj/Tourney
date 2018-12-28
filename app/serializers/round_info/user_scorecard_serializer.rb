module RoundInfo
  class UserScorecardSerializer
    include FastJsonapi::ObjectSerializer
    set_type :scorecard
    set_id :id
    belongs_to :tournament_round
    belongs_to :user
    belongs_to :new_course
    has_many :user_scores

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
  end
end