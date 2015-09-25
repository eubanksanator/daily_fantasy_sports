require 'rails_helper'

RSpec.describe Player do
  describe "validations" do
    it "has a valid factory for testing" do
      user = FactoryGirl.create(:player)
      expect(user).to be_valid
    end

    it "is invalid without a player name" do
      user_1 = FactoryGirl.create(:player, name: nil)
      user_2 = FactoryGirl.create(:player, name: "")

      expect(user_1).not_to be_valid
      expect(user_2).not_to be_valid
    end

    it "is invalid without a position" do
      user_1 = FactoryGirl.create(:player, position: nil)
      user_2 = FactoryGirl.create(:player, position: "")

      expect(user_1).not_to be_valid
      expect(user_2).not_to be_valid
    end

    it "is invalid without a salary" do
      user_1 = FactoryGirl.create(:player, salary: nil)
      user_2 = FactoryGirl.create(:player, salary: "")

      expect(user_1).not_to be_valid
      expect(user_2).not_to be_valid
    end

    it "is invalid without a projected points value" do
      user_1 = FactoryGirl.create(:player, projected_points: nil)
      user_2 = FactoryGirl.create(:player, projected_points: "")

      expect(user_1).not_to be_valid
      expect(user_2).not_to be_valid
    end

    it "is invalid without a price per point value" do
      user_1 = FactoryGirl.create(:player, price_per_point: nil)
      user_2 = FactoryGirl.create(:player, price_per_point: "")

      expect(user_1).not_to be_valid
      expect(user_2).not_to be_valid
    end
  end

  describe "associations" do

  end
end
