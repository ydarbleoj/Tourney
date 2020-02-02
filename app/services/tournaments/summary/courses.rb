# frozen_string_literal: true

module Tournaments
  module Summary
    class Courses
      def initialize(tournament)
        @tournament = tournament
      end

      def to_h
        {
          hardest_hole:   hardest_hole,
          easiest_hole:   easiest_hole,
          easiest_course: easiest_course,
          hardest_course: hardest_course,
          lowest_round:   lowest_round,
          avgs:           tournament_avgs
        }
      end
      private

      def tournament_avgs
        @tournament_avgs ||= round_aggs.tournament_avgs
      end

      def hardest_course
        course = sorted_rounds.last.new_course
        avg    = sorted_rounds.last.net_avg.to_f

        {
          name: course.name,
          par:  course.par,
          avg:  avg
        }
      end

      def easiest_course
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

      def lowest_round
        low = []
        low_score = nil

        low = scorecards.sort_by(&:total_net).each.with_index do |card, i|
          low_score = card.total_net if i.zero?
          low << card if card.total_net == low_score
        end

        low.map do |x|
          {
            score:    x.total_net,
            username: x.user.username,
            course:   x.new_course.name
          }
        end
      end

      def hardest_hole
        agg = round_aggs.sort_by(&:hardest_hole_hcap_diff).reverse.first
        hole = agg.hardest_hole
        diff = agg.hardest_hole_hcap_diff

       {
          hole_number: hole.number,
          diff:        diff,
          avg:         hole.par + diff,
          par:         hole.par,
          course_name: agg.new_course.name
        }
      end

      def easiest_hole
        agg = round_aggs.sort_by(&:easiest_hole_hcap_diff).reverse.first
        hole = agg.easiest_hole
        diff = agg.easiest_hole_hcap_diff

        {
          hole_number: hole.number,
          diff:        diff,
          avg:         hole.par + diff,
          par:         hole.par,
          course_name: agg.new_course.name
        }
      end

      def round_aggs
        @round_aggs ||= @tournament.round_aggs
      end

      def scorecards
        @scorecards ||= @tournament.scorecards
      end
    end
  end
end
