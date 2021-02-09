# frozen_string_literal: true

module Tourney
  module Entities
    class UserScore
      attr_reader :id, :net, :par, :number, :handicap, :score, :putts, :team_position

      def initialize(attributes = {})
        @id         = attributes.fetch(:id, nil)
        @net        = attributes.fetch(:net, nil)
        @par        = attributes.fetch(:par, nil)
        @number     = attributes.fetch(:number, nil)
        @handicap   = attributes.fetch(:handicap, nil)
        @score      = attributes.fetch(:score, nil)
        @putts      = attributes.fetch(:putts, nil)

        @team_position = attributes.fetch(:position, nil)
      end
    end
  end
end
