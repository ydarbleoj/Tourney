# frozen_string_literal: true

module Tourney
  module Entities
    module Team
      class Score
        attr_reader :id, :number, :net, :par, :score_1_id, :score_2_id, :team_id

        def initialize(attributes = {})
          @id         = attributes.fetch(:id)
          @number     = attributes.fetch(:number)
          @net        = attributes.fetch(:net)
          @par        = attributes.fetch(:par)
          @score_1_id = attributes.fetch(:score_1_id)
          @score_2_id = attributes.fetch(:score_2_id)
          @team_id    = attributes.fetch(:team_id)
        end
      end
    end
  end
end
