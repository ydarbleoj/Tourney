# frozen_string_literal: true

module Tourney
  module Entities
    class UserScore
      attr_reader :id, :net, :par, :number, :handicap, :score

      def initialize(attributes = {})
        @id         = attributes.fetch(:id)
        @net        = attributes.fetch(:net)
        @par        = attributes.fetch(:par)
        @number     = attributes.fetch(:number)
        @handicap   = attributes.fetch(:handicap)
        @score      = attributes.fetch(:score)
      end
    end
  end
end
