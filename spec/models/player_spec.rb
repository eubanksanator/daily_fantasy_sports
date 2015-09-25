require 'rails_helper'

RSpec.describe Player do
  describe "validations" do
    it "has a valid factory for testing" do
      user = FactoryGirl.build(:player)
      expect(user).to be_valid
    end

    it "is invalid without a player name" do
      user_1 = FactoryGirl.build(:player, name: nil)
      user_2 = FactoryGirl.build(:player, name: "")

      expect(user_1).not_to be_valid
      expect(user_2).not_to be_valid
    end

    it "is invalid without a position" do
      user_1 = FactoryGirl.build(:player, position: nil)
      user_2 = FactoryGirl.build(:player, position: "")

      expect(user_1).not_to be_valid
      expect(user_2).not_to be_valid
    end

    it "is invalid without a numeric salary" do
      user_1 = FactoryGirl.build(:player, salary: nil)
      user_2 = FactoryGirl.build(:player, salary: "")
      user_3 = FactoryGirl.build(:player, salary: "not #")

      expect(user_1).not_to be_valid
      expect(user_2).not_to be_valid
      expect(user_3).not_to be_valid
    end

    it "is invalid without a numeric projected points value" do
      user_1 = FactoryGirl.build(:player, projected_points: nil)
      user_2 = FactoryGirl.build(:player, projected_points: "")
      user_3 = FactoryGirl.build(:player, projected_points: "not #")

      expect(user_1).not_to be_valid
      expect(user_2).not_to be_valid
      expect(user_3).not_to be_valid
    end

    it "is invalid without a numeric price per point value" do
      user_1 = FactoryGirl.build(:player, price_per_point: nil)
      user_2 = FactoryGirl.build(:player, price_per_point: "")
      user_3 = FactoryGirl.build(:player, price_per_point: "not #")

      expect(user_1).not_to be_valid
      expect(user_2).not_to be_valid
      expect(user_3).not_to be_valid
    end
  end

  describe "associations" do

  end
end
