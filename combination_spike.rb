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
    player_array.to_a.delete_if { |player| player.projected_points <= 10.0 || player.price_per_point >= 900.0 }
  end

  def get_QB_and_RB_combinations
    three_RBs = remove_low_scoring_players(get_RBs).combination(3).to_a
    # remove_low_scoring_players(get_QBs.to_a).cartesian_product(remove_low_scoring_players(three_RBs.to_a)).to_a
    remove_low_scoring_players(get_QBs).to_a.cartesian_product(three_RBs)
  end
end

# QB_all.cartesian_product(RB_pairs).to_a.cartesian_product(all_TE).to_a

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

puts "=========="
puts "QB + RB(3)"
puts "=========="

flattened = lc.get_QB_and_RB_combinations.map { |combo| combo.flatten }
time =  Benchmark.realtime { flattened.each { |combo| puts combo[0].name + " " + combo[1].name + " " + combo[2].name + " " + combo[3].name } }
puts "Time elapsed is #{time*1000} milliseconds."
# puts Benchmark.measure { flattened.count }
