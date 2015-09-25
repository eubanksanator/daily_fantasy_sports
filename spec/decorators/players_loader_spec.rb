require 'rails_helper'
require 'players_loader'

RSpec.describe PlayersLoader do
  let(:dataset) { FactoryGirl.build(:dataset) }

  before :each do
    @players_loader = PlayersLoader.new(dataset)
  end

  describe "#save" do
    it "saves the players into ActiveRecord via the ETL process" do
      @players_loader.save

      expect(Dataset.where(name: "DraftKingsWeek1")).to exist
      expect(Player.where(name: "Drew Brees")).to exist
      expect(Player.where(name: "Tony Romo")).to exist
      expect(Player.where(name: "Andrew Luck")).to exist
    end
  end
end
