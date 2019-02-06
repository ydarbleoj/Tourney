module API
  module V2
    module Rounds
      class ScorecardsController < TournamentBaseController
        skip_before_action :authenticate_user

        def index
          p @tournament_user
          if @tournament_user
            scorecard = Scorecard.for_user_round(current_user.id, params['tournament_round_id'])
           p payload = RoundInfo::UserScorecardSerializer.new(scorecard).serialized_json
          else
            payload = {}
          end
          render json: payload
        end

        def update
          @scorecard = Scorecard.includes(:user_scores).find(params['id'])
          completed = @scorecard.user_scores.size == 18

          if scorecard_params['finished'] == true && completed
            @scorecard.update!(finished: true, dnf: false)
            @scorecard.leaderboard.update(dnf: false)
            run_aggs
          else
            @scorecard.update(finished: true, dnf: true)
            @scorecard.leaderboard.update(dnf: true)
          end

          if @scorecard.save
            render json: { success: true }
          else
            render json: { success: false }
          end
        end

        private
        def scorecard_params
          params.require(:scorecard).permit(:total_score, :total_putts, :total_3putts,
            :new_course_id, :user_id, :tournament_round_id, :total_net, :handicap, :finished, :dnf,
            user_scores_attributes: [:id, :number, :score, :putts, :skin, :net, :handicap, :net_skin])
        end

        def run_aggs
          Aggs::CourseUpdate.call(@scorecard.new_course_id, current_user.id)
          Aggs::RoundSetup.call(@scorecard.tournament_round_id)
        end

      end
    end
  end
end