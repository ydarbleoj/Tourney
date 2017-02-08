module Tournaments
  class BaseController < ApplicationController
    before_action :authenticate_user!
    before_action :current_tournament


    def current_tournament
      p "HERE"
      Tournament.find(params[:tournament_id])
    end

  end
end