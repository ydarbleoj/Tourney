# frozen_string_literal: true

module Tourney
  module Entities
    module Team
      class Score
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
        end

        attr_reader :id, :number, :net, :par, :score_1, :score_2,
                    :team_id, :score1_id, :score2_id
      end
    end
  end
end
