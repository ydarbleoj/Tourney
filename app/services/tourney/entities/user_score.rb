# frozen_string_literal: true

module Tourney
  module Entities
    class UserScore
      attr_reader :id, :net, :par, :number

      def initialize(user_score)
        @user_score = user_score
        @id         = user_score.id
        @net        = user_score.net
        @par        = user_score.par
        @number     = user_score.number
      end

      def team
        @team ||= scorecard.team
      end
    end
  end
end
