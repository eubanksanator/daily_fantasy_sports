require 'rails_helper'
require 'load'

RSpec.describe "Load" do
  let(:transformation) { [{ :name => "Andrew Luck",
                            :position => "QB",
                            :projected_points => 20.2,
                            :salary => 8200,
                            :price_per_point => 405.9
                          },
                          { :name => "Drew Brees",
                            :position => "QB",
                            :projected_points => 20.6,
                            :salary => 7800,
                            :price_per_point => 378.6
                          },
                          { :name => "Matt Ryan",
                            :position => "QB",
                            :projected_points => 19.3,
                            :salary => 7400,
                            :price_per_point => 383.4
                          },
                          { :name => "Russell Wilson",
                            :position => "QB",
                            :projected_points => 18.6,
                            :salary => 7300,
                            :price_per_point => 392.5
                          },
                          { :name =>"Tony Romo",
                            :position => "QB",
                            :projected_points => 19.6,
                            :salary => 7100,
                            :price_per_point => 362.2
                          }] }

  before :each do
    @load = Load.new(transformation)
  end

  describe "#new" do
    it "accepts an array and returns a load" do
      expect(@load).to be_a(Load)
    end
  end

  describe "#store_in_activerecord" do
    it "creates ActiveRecord objects using the data" do
      @load.store_in_activerecord

      expect(Player.where(name: "Drew Brees", position: "QB", projected_points: 20.6)).to exist
      expect(Player.where(name: "Matt Ryan", position: "QB", projected_points: 19.3, salary: 7300)).to exist
      expect(Player.where(name: "Tony Romo", salary: 7100, price_per_point: 362.2)).to exist
      expect(Player.where(name: "Robert Griffin III")).not_to exist
    end
  end
end

