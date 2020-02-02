# frozen_string_literal: true

module Tournaments
  module Summary
    class Index
      def initialize(tournament_id, user)
        @tournament_id = tournament_id
        @user          = user
      end

      def to_h
        {
          course: course_summary,
          user:   player_summary
        }
      end

      private

      def course_summary
        Tournaments::Summary::Courses.new(tournament).to_h
      end

      def player_summary
        Tournaments::Summary::Players.new(tournament, @user).to_h
      end

      def tournament
        @tournament ||= Tournament.includes(tourn_includes).find(@tournament_id)
      end

      def tourn_includes
        [
          round_aggs: [
            :new_course,
            :hardest_hole,
            :easiest_hole,
            user_scores: :hole
          ],
          scorecards: [
            :user,
            :new_course,
            user_scores: :hole
          ]
        ]
      end
    end
  end
end
