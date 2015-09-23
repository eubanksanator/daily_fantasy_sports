require 'CSV'

class Extraction
  attr_reader :salaries, :rankings

  def initialize(salaries, rankings)
    @salaries = salaries
    @rankings = rankings
  end

  def output
    get_player_info
  end

  private

  def get_player_info
    players = []
    CSV.foreach(salaries) do |row|
      player = {
        :name             => row[1],
        :position         => row[0],
        :projected_points => projected_points(row),
        :salary           => salary(row),
        :price_per_point  => (salary(row) / projected_points(row)).to_f.round(1)
      }
      # remove players who have missing data
      players << player if player[:projected_points] != 0.0
    end
    players
  end

  def salary(row)
    row[2].to_i
  end

  def projected_points(row)
    get_ranking_info[row[1]].to_f
  end

  def get_ranking_info
    players_rankings = Hash.new
    CSV.foreach(rankings) do |row|
      players_rankings[row[3]] = row[7]
    end
    players_rankings.delete("Player")
    players_rankings
  end
end
