module Leaderboards
  class SetPositions

    def by_scores(scores, obj)
      arr, pos = [], 0

      scs = scores.group_by { |x| x[obj.to_sym] }.sort.map { |x| x[1] }
      scs.each do |x|
        pos = pos == 0  ? 1 : pos
        arr << x.map { |x| x.merge({pos: pos}) }
        pos += x.length
      end
      arr.flatten(1)
    end

    def with_player(player, tournament, obj)
      hsh, pos = {}, 0
      scores = tournament.leaderboards.pluck(obj.to_sym)
        .sort.group_by { |x| x }.map { |x| x[1] }

      scores.each do |x|
        pos = pos == 0 ? 1 : pos
        hsh = player.merge({ pos: pos }) if player[obj.to_sym] == x.first
        pos += x.length
      end
      hsh
    end


  end
end