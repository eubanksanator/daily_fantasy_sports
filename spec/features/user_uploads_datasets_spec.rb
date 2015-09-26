require 'rails_helper'

feature "User imports datasets" do
  scenario "successfully" do
    create_dataset(name: "DraftKingsWeek2", salaries: "example_salaries.csv", rankings: "example_rankings.csv")

    expect(page).to have_message('Datasets imported successfully!')
    expect(Dataset.where(salaries_filename: "example_salaries.csv", rankings_filename: "example_rankings.csv")).to exist
  end

  scenario "unsuccessfully due to missing a Salary Dataset" do
    create_dataset(name: "DraftKingsWeek2", rankings: "example_rankings.csv")

    expect(page).to have_message('All form fields must be completed!')
    expect(Dataset.where(salaries_filename: "example_salaries.csv")).not_to exist
  end

  scenario "unsuccessfully due to missing a Rankings Dataset" do
    create_dataset(name: "DraftKingsWeek2", salaries: "example_salaries.csv")

    expect(page).to have_message('All form fields must be completed!')
    expect(Dataset.where(rankings_filename: "example_rankings.csv")).not_to exist
  end

  scenario "unsuccessfully due to missing a name" do
    create_dataset(salaries: "example_salaries.csv", rankings: "example_rankings.csv")

    expect(page).to have_message('All form fields must be completed!')
    expect(Dataset.where(rankings_filename: "example_rankings.csv")).not_to exist
  end

  def create_dataset(args)
    name     = args[:name]
    rankings = args[:rankings]
    salaries = args[:salaries]

    visit root_path

    click_on("Import new datasets")
    fill_in("Name", with: name) if name.present?
    attach_file("Salaries", Rails.root + "spec/fixtures/#{salaries}") if salaries.present?
    attach_file("Rankings", Rails.root + "spec/fixtures/#{rankings}") if rankings.present?
    click_on("Import")
  end

  def have_message(message)
    have_css('p', text: message)
  end
end
