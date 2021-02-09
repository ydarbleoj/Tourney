module API
  module V2
    module Tournaments
      module Admin
        class TeeTimesController < TournamentBaseController
          skip_before_action :authenticate_user
          before_action :set_tee_times
          before_action :find_team

          def index
            render json: {
              times: Admins::TeeTimesSerializer.new(@tee_times).serialized_json,
              awaiting: Admins::AwaitingSerializer.new(
                awaiting_scorecards
              ).serialized_json
            }
          end

          def create
            @res = false
            Team.transaction do
              @team.team_cards.delete_all
              create_team_players
              @res = @team.save!
            end
            @res
          end

          private

          def find_team
            @team = Team.find_by(id: params["team_id"])
          end

          def create_team_players
            Scorecard.where(:id => params["ids"]).each.with_index do |scorecard, index|
              TeamCard.create(
                :scorecard_id => scorecard.id,
                :team_id      => @team.id,
                :position     => index + 1
              )
            end
          end

          def set_tee_times
            @tee_times = Team.admin_tee_times(params[:tournament_round_id])
          end

          def users_with_times
            @tee_times.map do |card|
              card.team_cards.map(&:scorecard_id)
            end.flatten
          end

          def awaiting_scorecards
            @tournament.scorecards
                       .where.not(id: users_with_times)
                       .where(:tournament_round_id => params["tournament_round_id"])
          end
        end
      end
    end
  end
end