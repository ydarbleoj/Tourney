# frozen_string_literal: true

class TeamCard < ApplicationRecord
  belongs_to :team
  belongs_to :scorecard
end
