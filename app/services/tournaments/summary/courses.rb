# frozen_string_literal: true

module Tournaments
  module Summary
    class Courses
      def initialize(tournament)
        @tournament = tournament
      end

      def to_h
        {
          easiest_course: easiest_course,
          hardest_course: hardest_course,
          avgs:           tournament_avgs
        }
      end
      private

      def tournament_avgs
        @tournament_avgs ||= round_aggs.tournament_avgs
      end

      def hardest_course
        return unless sorted_rounds.present?

        course = sorted_rounds.last.new_course
        avg    = sorted_rounds.last.net_avg.to_f

        {
          name: course.name,
          par:  course.par,
          avg:  avg
        }
      end

      def easiest_course
        return unless sorted_rounds.present?

        course = sorted_rounds.first.new_course
        avg    = sorted_rounds.first.net_avg.to_f

        {
          name: course.name,
          par:  course.par,
          avg:  avg
        }
      end

      def sorted_rounds
        @sorted_rounds ||= round_aggs.sort_by(&:net_avg)
      end

      def hardest_hole
        return unless round_aggs.present?

        agg = round_aggs.sort_by(&:hardest_hole_hcap_diff).reverse.first
        hole = agg.hardest_hole
        diff = agg.hardest_hole_hcap_diff

       {
          hole_number: hole.number,
          diff:        diff,
          avg:         hole.par + diff.to_f,
          par:         hole.par,
          course_name: agg.new_course.name
        }
      end

      def easiest_hole
        return unless round_aggs.present?

        agg = round_aggs.sort_by(&:easiest_hole_hcap_diff).reverse.first
        hole = agg.easiest_hole
        diff = agg.easiest_hole_hcap_diff

        {
          hole_number: hole.number,
          diff:        diff,
          avg:         hole.par + diff.to_f,
          par:         hole.par,
          course_name: agg.new_course.name
        }
      end

      def round_aggs
        @round_aggs ||= @tournament.round_aggs
      end

      def scorecards
        @scorecards ||= @tournament.scorecards.active
      end
    end
  end
end
