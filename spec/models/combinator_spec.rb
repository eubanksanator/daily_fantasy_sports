require 'rails_helper'

RSpec.describe Combinator do
  let(:lineup) do
    {
      "QB"   => 1,
      "RB"   => 2,
      "WR"   => 3,
      "TE"   => 1,
      "Flex" => 1,
      "DST"  => 1
    }
  end

  before :each do
    @combinator = Combinator.new(data: Player.all, config: lineup)
  end

  describe "validations" do
    it "accepts data and a configuration" do
      expect(@combinator).to be_a(Combinator)
    end

    it "is valid without a specific lineup" do
      combinator = Combinator.new(data: Player.all)
      expect(combinator).to be_a(Combinator)
      expect(combinator.config).to eq(lineup)
    end
  end

  describe "#output_data" do
    it "returns an array of the data" do
      expect(@combinator.output_data).to eq(Player.all)
    end
  end
end
