require 'rails_helper'

RSpec.describe Combinator do
  let(:lineup) { {
                   "QB"   => 1,
                   "RB"   => 2,
                   "WR"   => 3,
                   "TE"   => 1,
                   "Flex" => 1,
                   "DST"  => 1
                 } }

  before :each do
    @combinator = Combinator.new(Player.all, lineup)
  end

  describe "validations" do
    it "accepts data and a configuration" do
      expect(@combinator).to be_a(Combinator)
    end
  end

  describe "#output_data" do
    it "returns an array of the data" do
      expect(@combinator.output_data).to eq(Player.all)
    end
  end
end
