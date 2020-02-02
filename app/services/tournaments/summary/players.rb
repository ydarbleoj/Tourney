# frozen_string_literal: true

module Tournaments
  module Summary
    class Players
      def initialize(tournament, user)
        @tournament = tournament
        @user       = user
      end

      def to_h
        {
          lowest_round: lowest_round,
          avgs:         user_avgs,
          par_avgs:     par_avgs
        }
      end

      private

      def par_avgs
        return nil unless users_par_avgs.present?

        users_par_avgs.map do |x|
          x = x.as_json
          {
            par: x['par'],
            avg: x["avg"].to_f.round(2)
          }
        end
      end

      # def user_hardest_hole
      #   user_ordered_holes[-1]
      # end

      # def user_easiest_hole
      #   user_ordered_holes[0]
      # end

      # def user_ordered_holes
      #   return [] unless user_scores.present?

      #   @ordered_holes ||= user_scores.flatten.sort_by { |x| x.net.to_f - x.hole.par }
      #     .map do |xx|
      #       {
      #         par: xx.hole.par,
      #         diff: (xx.net.to_f - xx.hole.par).round(2),
      #         number: xx.hole.number,
      #         course: xx.hole.new_course.name
      #       }
      #     end
      # end

      def user_scores
        @user_scores ||= user_scorecards.map(&:user_scores)
      end

      def users_par_avgs
        @users_par_avgs ||= user_scorecards
                              .joins(:user_scores)
                              .select('AVG(user_scores.net) AS avg, par')
                              .group(:par)
      end

      def user_avgs
        user_scorecards.round_averages
      end

      def lowest_round
        low = []
        low_score = nil

        scorecards.sort_by(&:total_net).each.with_index do |card, i|
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

      def user_scorecards
        @user_scorecards ||= scorecards.where(user_id: @user.id)
      end

      def scorecards
        @scorecards ||= @tournament.scorecards
      end
    end
  end
end
