# frozen_string_literal: true

module Tourney
  module Repository
    module Team
      class Score
        def self.persist(team, score_entity)
          team_score = team.team_scores.find_or_initialize_by(
            :number => score_entity.number,
            :par    => score_entity.par
          )

          team_score.score_1_id = score_entity.score1_id
          team_score.score_2_id = score_entity.score2_id
          team_score.net        = score_entity.net

          team_score.save!
        end
      end
    end
  end
end
