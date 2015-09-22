require 'rails_helper'
require 'extraction'

RSpec.describe "Extraction" do
  let(:salaries_data) { File.open(Rails.root + 'spec/fixtures/example_salaries.csv') }
  let(:rankings_data) { File.open(Rails.root + 'spec/fixtures/example_rankings.csv') }

  before :each do
    @extraction = Extraction.new(salaries_data, rankings_data)
  end

  describe "#new" do
    it "accepts two datasets and creates an extraction" do
      expect(@extraction).to be_a(Extraction)
    end
  end

  describe "#output" do
    it "returns an array of hashes with correct data" do
      data = [{ :name => "Andrew Luck",
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
              }]

      expect(@extraction.output).to eq(data)
    end
  end
end

