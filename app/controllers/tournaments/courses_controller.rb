module Tournaments
  class CoursesController < Tournaments::BaseController
    before_action :authenticate_user!

    def index
      p current_tournament
    end
  end
end