module Info
  module MoneyList
    class PreviewsController  < ApplicationController
      before_action :authenticate_user
      before_action :set_tournament

      def index
        money_list = map_list
        money_list = Leaderboards::SetPositions.new.by_scores(money_list, 'total')
        payload = preview_with_player(money_list).flatten(1)

        render json: payload
      end

      private
      def check_user
        @tournament.stroke_moneys.where(user_id: current_user.id)
      end

      def preview_with_player(money_list)
        top_five = money_list.select { |x| x if x[:pos] < 6 }.map { |x| x }.first(5)
        inc = top_five.any? {|x| x[:user_id] == current_user.id }

        if inc == true || check_user.blank?
          top_five
        else
          top_five << money_list.select { |x| x if x[:user_id] == current_user.id }.map { |x| x }
        end
      end

      def map_list
        p 'MONEYLIST PREVIEW'
       p team    = teams
       p skin    = skins
       p stroke  = strokes
        putting = puttings

        [team, skin, stroke, putting].flatten(1).group_by { |x| x[:username] }.map { |t| build_hash(t[1]) }
      end

      def teams
        @tournament.team_moneys.includes(:user).map { |x| { user_id: x.user.id, username: x.user.first_name + ' ' + x.user.last_name.first, team: x.total } }
      end

      def skins
        @tournament.skins_moneys.includes(:user).map { |x| { user_id: x.user.id, username: x.user.first_name + ' ' + x.user.last_name.first, skins: x.total } }
      end

      def strokes
        @tournament.stroke_moneys.includes(:user).map { |x| { user_id: x.user.id, username: x.user.first_name + ' ' + x.user.last_name.first, stroke: x.money } }
      end

      def puttings
        @tournament.putting_moneys.includes(:user).map { |x| { user_id: x.user.id, username: x.user.first_name + ' ' + x.user.last_name.first, putting: x.money } }
      end

      def build_hash(arr)
        hsh = arr[0]
        arr[1..-1].each do |t|
          hsh.merge!(t)
        end
        hsh.merge!(sum_total(hsh))
      end

      def sum_total(hsh)
        team    = hsh[:team].blank? ? 0 : hsh[:team]
        stroke  = hsh[:stroke].blank? ? 0 : hsh[:stroke]
        skins   = hsh[:skins].blank? ? 0 : hsh[:skins]
        putting = hsh[:putting].blank? ? 0 : hsh[:putting]
        { total: (team + stroke + skins + putting) }
      end

      def set_tournament
        @tournament = Tournament.find(params[:tournament_id])
      end
    end
  end
end
