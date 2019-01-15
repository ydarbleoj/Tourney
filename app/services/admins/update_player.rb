module Admins
  class UpdatePlayer

    def self.call(params)
      new(params).call
    end

    def initialize(params)
      @leaderboard = Leaderboard.includes({scorecards: :user_scores}).find(params['id'])
      @role = params['role'].blank? ? nil : params['role']
      @handicap = params['handicap'].blank? ? nil : params['handicap']
    end

    def call
      ActiveRecord::Base.transaction do
        update_user if @role.present?
        update_leaderboard if @handicap.present?
      end
      true
    rescue StandardError => e
      p "error #{e}"
      false
    end

    private
    def update_user
      role = @role == 'admin' ? true : false
      @leaderboard.user.update(admin: role)
    end

    def update_leaderboard
      @leaderboard.update(handicap: @handicap)
      update_scorecards
    end

    def update_scorecards
      @leaderboard.scorecards.each { |x| x.update(handicap: @handicap) }
      @leaderboard.scorecards.each do |scorecard|
        update_user_scores_net(scorecard.user_scores)
        scorecard.user_scores.each { |x| update_leaderboard_scoring(x.id) }
      end
    end

    def update_user_scores_net(user_scores)
      user_scores.each { |x| x.save }
    end

    def update_leaderboard_scoring(score)
      Scoreboard::Scoring.call(score)
    end
  end
end