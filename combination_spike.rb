require 'combinatorics/cartesian_product'

class LineupCombination
  attr_reader :players

  def initialize(players)
    @players = players
  end

  def get_QBs
    players.where(position: "QB")
  end

  def get_RBs
    players.where(position: "RB")
  end

  def get_TEs
    players.where(position: "TE")
  end

  def get_WRs
    players.where(position: "WR")
  end

  def get_flex
    flex = []
    flex << get_RBs
    flex << get_TEs
    flex << get_WRs
    flex.flatten
  end

  def get_DEFs
    players.where(position: "DEF")
  end

  def remove_low_scoring_players(player_array)
    player_array.to_a.delete_if { |player| player.projected_points <= 10.0 || player.price_per_point >= 500.0 }
  end
end

# Runner

lc = LineupCombination.new(Player.all)

puts "ALL THE QBS"
puts "==========="
lc.get_QBs.each { |player| puts player.name }

puts "============"
puts "ALL THE FLEX"
puts "============"
lc.get_flex.each { |player| puts player.name + " is a " + player.position }

puts "============"
puts "LOWS REMOVED"
puts "============"
lc.remove_low_scoring_players(lc.get_QBs).each { |player| puts player.name + " will score more than " + player.projected_points.to_s + " and ppp is less than " + player.price_per_point.to_s + " and he is a " + player.position }

lc.remove_low_scoring_players(lc.get_flex).each { |player| puts player.name + " will score more than " + player.projected_points.to_s + " and ppp is less than " + player.price_per_point.to_s  + " and he is a " + player.position }
