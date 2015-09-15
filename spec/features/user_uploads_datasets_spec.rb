require 'rails_helper'

feature "User imports datasets" do
  scenario "successfully" do
    visit root_path

    click_on("Import new datasets")
    attach_file("SalaryDataset", Rails.root + "spec/fixtures/example_salary.csv")
    attach_file("RankingsDataset", Rails.root + "spec/fixtures/example_rankings.csv")
    click_on("Import")

    expect(page).to have_css('h3', text: 'Datasets imported successfully!')
    expect(SalaryDataset.where(name: "example_salary.csv")).to exist
    expect(RankingsDataset.where(name: "example_rankings.csv")).to exist
  end

  scenario "unsuccessfully due to missing a Salary Dataset" do
    visit root_path

    click_on("Import new datasets")
    attach_file("SalaryDataset", Rails.root + "spec/fixtures/example_salary.csv")
    click_on("Import")

    expect(page).to have_css('h3', text: 'Must upload both a Salary and Rankings Dataset!')
    expect(SalaryDataset.where(name: "example_salary.csv")).not_to exist
    expect(RankingsDataset.where(name: "example_rankings.csv")).not_to exist
  end

  scenario "unsuccessfully due to missing a Rankings Dataset" do
    visit root_path

    click_on("Import new datasets")
    attach_file("RankingsDataset", Rails.root + "spec/fixtures/example_rankings.csv")
    click_on("Import")

    expect(page).to have_css('h3', text: 'Must upload both a Salary and Rankings Dataset!')
    expect(SalaryDataset.where(name: "example_salary.csv")).not_to exist
    expect(RankingsDataset.where(name: "example_rankings.csv")).not_to exist
  end
end
