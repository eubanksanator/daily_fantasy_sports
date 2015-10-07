require 'rails_helper'
require 'transformation'

RSpec.describe "Transformation" do
  let(:extraction){ [{ :name => "Andrew Luck",
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
  let(:result) { extraction }

  before :each do
    @transformation = Transformation.new(extraction)
  end

  describe "#new" do
    it "accepts an array and returns a transformation" do
      expect(@transformation).to be_a(Transformation)
    end
  end

  describe "#output" do
    it "returns transformed data as an array of hashes" do
      expect(@transformation.output).to eq(result)
    end
  end
end

