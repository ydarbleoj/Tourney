module API
  module V2
    module Tournaments
      module Admin
        class InvitationsController < TournamentBaseController
          skip_before_action :authenticate_user

          def create
            res = send_invites
            if res
              set_users
              invited
              invitees

              render json: {
                success: true,
                users: AdminUsersSerializer.new(@users).serialized_json,
                invited: InvitationSerializer.new(@invited).serialized_json,
                invitees: @invitees
              }
            else
              render json: { success: false, message: @error }
            end
          end


          private
          def send_invites
            emails = params['invitation']
            ActiveRecord::Base.transaction do
              emails.each do |email|
                user = User.find_by_email(email)
                inv = Invitation.create!(email: email, first_name: user.first_name, last_name: user.last_name, tournament_id: @tournament.id)
                # InvitationMailer.invite(inv).deliver_now
              end
            end
            true
          rescue StandardError => e
            @error = e.message
            p "error #{e}"
            false
          end

          def invited
            @invited = @tournament.invitations.pending
          end

          def set_users
            @users = Leaderboard.admin_users(@tournament.id)
          end

          def invitees
            emails = [@invited.map(&:email), @users.map(&:email)].flatten
            inv = Tournament.invite_list(@tournament.name, emails)
            @invitees = tournament_full ? [] : inv
          end

          def tournament_full
            @tournament.num_players == @users.size
          end
        end
      end
    end
  end
end