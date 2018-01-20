module Tournaments
  class RoundsController < Tournaments::BaseController
    # before_action :authenticate_user!

    def index
      p "INDEX"
      p current_tournament
    end

    def show
      p "show"
      p current_tournament
    end
  end
end