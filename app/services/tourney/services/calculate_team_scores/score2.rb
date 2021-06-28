# frozen_string_literal: true

module Tourney
  module Services
    module CalculateTeamScores
      class Score2 < Tourney::Services::CalculateTeamScores::Base
        def id
          (new? && !both_scores?) ? nil : lowest_score[0]
        end

        def net
          (new? && !both_scores?) ? nil : lowest_score[1]
        end

        def update?
          !net.blank?
        end

        private


      end
    end
  end
end
