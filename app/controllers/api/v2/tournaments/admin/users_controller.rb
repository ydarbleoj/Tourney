module API
  module V2
    module Tournaments
      module Admin
        class UsersController < TournamentBaseController
          skip_before_action :authenticate_user
          before_action :set_users

          def index
            set_users
            invited
            invitees

            render json: {
              users: AdminUsersSerializer.new(@users).serialized_json,
              invited: InvitationSerializer.new(@invited).serialized_json,
              invitees: @inv
            }
          end

          def update
            res = Admins::UpdatePlayer.call(params)
            if res
              render json: { success: true }
            else
              render json: { success: false }
            end
          end

          def destroy
            p params
            leaderboard = Leaderboard.find(params['id'])
            user = leaderboard.user
            ActiveRecord::Base.transaction do
              TournamentUser.where(tournament_id: @tournament.id, user_id: user.id).first.delete
              leaderboard.destroy
            end
            true
            render json: { success: true }
          rescue StandardError => e
            p "error #{e.message}"
            render json: { success: false }
          end

          private
          def set_users
            @users = Leaderboard.admin_users(@tournament.id)
          end

          def invited
            @invited = @tournament.invitations.pending
          end

          def invitees
            return false if tournament_full
            inv = Tournament.invite_list(@tournament.name)
            @inv = inv.select { |x| x if !remove.include?(x['user_email']) }.map { |xx| p xx }
          end

          def remove
            [@invited.map(&:email), @users.map { |x| x.user.email }].flatten
          end

          def tournament_full
            @tournament.num_players == @users.size
          end
        end
      end
    end
  end
end