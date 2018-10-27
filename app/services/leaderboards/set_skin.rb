module Leaderboards
  class SetSkin

    def self.call(user_score, type)
      new(user_score, type).call
    end

    def initialize(user_score, type)
      @user_score = user_score
      @scorecard  = user_score.scorecard
      @round      = user_score.tournament_round
      @type       = type
    end

    def call
      hole_scores
      current_and_lowest_scores
      ActiveRecord::Base.transaction do
        compare_lowest
      end
    rescue StandardError => e
      p "SetSkins -- #{e}"
    end

    private
    attr_reader :user_score, :scorecard, :round, :current_skin, :scores, :lowest_scores, :type

    def hole_scores
      @scores = round.user_scores.skins_for(user_score.number, type)
    end

    def current_and_lowest_scores
      current_skin?
      group_lowest_scores
    end

    def compare_lowest
      if current_skin
        if lowest_scores.size == 1 && current_skin.score > lowest_scores.first.score
          current_user_win
          remove_skin
        elsif lowest_scores.size > 1
          remove_skin
        else
          false
        end
      else
        if lowest_scores.size == 1
          lowest_score_win
        else
          false
        end
      end
    end

    def current_skin?
      @current_skin = scores.select { |x| x if x.skin }.map { |x| x }.compact.first
    end

    def group_lowest_scores
      @lowest_scores = scores.sort_by(&:score).group_by { |x| x.score }.map { |x| x[1] }[0]
    end

    def current_user_win
      user_score.update(type.to_sym => true)
      scorecard.update_skins(type)
    end

    def remove_skin
      current_skin.update(type.to_sym => false)
      current_skin.scorecard.update_skins(type)
    end

    def lowest_score_win
      lowest_scores.first.update(type.to_sym => true)
      lowest_scores.first.scorecard.update_skins(type)
    end
  end
end