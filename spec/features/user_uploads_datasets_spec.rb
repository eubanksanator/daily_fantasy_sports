require 'rails_helper'

feature "User imports datasets" do
  scenario "successfully" do
    visit root_path

    click_on("Import new datasets")
    fill_in("Name", with: "DraftKingsWeek2")
    attach_file("Salaries", Rails.root + "spec/fixtures/example_salaries.csv")
    attach_file("Rankings", Rails.root + "spec/fixtures/example_rankings.csv")
    click_on("Import")

    expect(page).to have_css('p', text: 'Datasets imported successfully!')
    expect(Dataset.where(salaries_filename: "example_salaries.csv", rankings_filename: "example_rankings.csv")).to exist
  end

  scenario "unsuccessfully due to missing a Salary Dataset" do
    visit root_path

    click_on("Import new datasets")
    fill_in("Name", with: "DraftKingsWeek2")
    attach_file("Salaries", Rails.root + "spec/fixtures/example_salaries.csv")
    click_on("Import")

    expect(page).to have_css('p', text: 'All form fields must be completed!')
    expect(Dataset.where(salaries_filename: "example_salaries.csv")).not_to exist
  end

  scenario "unsuccessfully due to missing a Rankings Dataset" do
    visit root_path

    click_on("Import new datasets")
    fill_in("Name", with: "DraftKingsWeek2")
    attach_file("Rankings", Rails.root + "spec/fixtures/example_rankings.csv")
    click_on("Import")

    expect(page).to have_css('p', text: 'All form fields must be completed!')
    expect(Dataset.where(rankings_filename: "example_rankings.csv")).not_to exist
  end

  scenario "unsuccessfully due to missing a name" do
    visit root_path

    click_on("Import new datasets")
    attach_file("Rankings", Rails.root + "spec/fixtures/example_rankings.csv")
    attach_file("Salaries", Rails.root + "spec/fixtures/example_salaries.csv")
    click_on("Import")

    expect(page).to have_css('p', text: 'All form fields must be completed!')
    expect(Dataset.where(rankings_filename: "example_rankings.csv")).not_to exist
  end
end
