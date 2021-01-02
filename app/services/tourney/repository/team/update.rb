# frozen_string_literal: true

module Tourney
  module Repository
    module Team
      class Update
        def self.execute(team)
          team.update(:total_net => team.scores_total)
        end
      end
    end
  end
end
