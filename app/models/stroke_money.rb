class StrokeMoney < ApplicationRecord
  belongs_to :user
  belongs_to :tournament

  def self.update_player_money(tournament)
    @purse = tournament.num_players * 30

    scores = tournament.leaderboards.stroke_money
    players = set_position(scores)
    players = set_purse(players)
    set_money(players, tournament)
  end

  def self.set_position(scores)
    Position.setter(scores, :total_score)
    scores
  end

  def self.set_purse(players)
    sc = players.group_by { |x| x.position }.map { |x| x }
    sc.map do |group|
      group[1].map { |xx| xx.purse = purse(group[0], group.length) }
    end
    players
  end

  def self.set_money(players, tournament)
    StrokeMoney.transaction do
      players.each do |x|
        sm = StrokeMoney.where(tournament_id: tournament.id, user_id: x.user_id).first_or_create
        sm.update(money: x.purse, position: x.position)
      end
    end
  end

  def self.purse(pos, group_length)
    case pos
    when 1
      if group_length == 1
        (@purse * 0.5625)
      else
        if group_length == 2
          (@purse * 0.40625)
        else
          (@purse * 1) / (group_length - 1)
        end
      end
    when 2
      if group_length == 1
        (@purse * 0.25)
      else
        (@purse * 0.4375) / group_length
      end
    when 3
       (@purse * 0.1875) / group_length
    else
      0
    end
  end

end
def run_all(id, num)
 r1 = TournamentRound.includes({new_course: :holes}).where(tournament_id: id, round_number: num).first
 r1_course = r1.new_course
 r1.scorecards.each { |x| x.user_scores.each { |xx| xx.update(hole_id: r1_course.holes.where(number: xx.number).first.id) } }
end