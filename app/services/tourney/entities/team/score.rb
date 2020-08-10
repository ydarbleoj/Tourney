# frozen_string_literal: true

module Tourney
  module Entities
    module Team
      class Score
        def initialize(user_score_id)
          @user_score = UserScore.find(user_score_id)
        end

        def total

        end
      end
    end
  end
end
