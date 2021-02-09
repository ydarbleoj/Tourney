# frozen_string_literal: true

module Tourney
  module Entities
    module Team
      class Score
        attr_reader :id, :number, :net, :par, :score1, :score2,
                    :team_id, :score1_id, :score2_id, :team_size

        def initialize(attributes = {})
          @id        = attributes.fetch(:id, nil)
          @number    = attributes.fetch(:number, nil)
          @net       = attributes.fetch(:net, nil)
          @par       = attributes.fetch(:par, nil)
          @score1_id = attributes.fetch(:score1_id, nil)
          @score2_id = attributes.fetch(:score2_id, nil)
          @score1    = attributes.fetch(:score1, nil)
          @score2    = attributes.fetch(:score2, nil)
          @team_id   = attributes.fetch(:team_id, nil)

          @team_size  = attributes.fetch(:team_size, nil)
          @next_score = attributes.fetch(:next_score)
        end

        def next_score_id
          @next_score&.id
        end

        def next_score_net
          @next_score&.net
        end
      end
    end
  end
end
