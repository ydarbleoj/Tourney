# frozen_string_literal: true

module Tourney
  module Entities
    module Team
      class Score
        attr_reader :id, :number, :net, :par, :score_1_id, :score_2_id, :team_id

        def initialize(attributes = {})
          @id      = attributes.fetch(:id)
          @number  = attributes.fetch(:number)
          @net     = attributes.fetch(:net)
          @par     = attributes.fetch(:par)
          @score_1 = attributes.fetch(:score_1)
          @score_2 = attributes.fetch(:score_2)
          @team_id = attributes.fetch(:team_id)
        end

        def lower_than_first(score)
          score < @score_1
        end

        def lower_than_second(score)
          return true if @score_2.blank?

          score < @score_2
        end

      end
    end
  end
end
