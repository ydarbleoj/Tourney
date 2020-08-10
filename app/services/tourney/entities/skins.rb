# frozen_string_literal: true

module Tourney
  module Entities
    class Skins
      def initialize(user_score_id)
        @user_score = UserScore.find(user_score_id)
      end

      def method_name

      end

    end
  end
end
