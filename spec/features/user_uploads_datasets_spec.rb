require 'rails_helper'

feature "User imports datasets" do
  scenario "successfully" do
    create_dataset(name: "DraftKingsWeek2", salaries_file: "example_salaries.csv", rankings_file: "example_rankings.csv")

    expect(page).to have_message('Datasets imported successfully!')
    expect(Dataset.where(salaries_filename: "example_salaries.csv", rankings_filename: "example_rankings.csv")).to exist
  end

  scenario "unsuccessfully due to missing a Salary Dataset" do
    create_dataset(name: "DraftKingsWeek2", rankings_file: "example_rankings.csv")

    expect(page).to have_message('All form fields must be completed!')
    expect(Dataset.where(salaries_filename: "example_salaries.csv")).not_to exist
  end

  scenario "unsuccessfully due to missing a Rankings Dataset" do
    create_dataset(name: "DraftKingsWeek2", salaries_file: "example_salaries.csv")

    expect(page).to have_message('All form fields must be completed!')
    expect(Dataset.where(rankings_filename: "example_rankings.csv")).not_to exist
  end

  scenario "unsuccessfully due to missing a name" do
    create_dataset(salaries_file: "example_salaries.csv", rankings_file: "example_rankings.csv")

    expect(page).to have_message('All form fields must be completed!')
    expect(Dataset.where(rankings_filename: "example_rankings.csv")).not_to exist
  end

  def create_dataset(args)
    name     = args[:name]
    rankings_file = args[:rankings_file]
    salaries_file = args[:salaries_file]

    visit_new_dataset_page

    fill_in("Name", with: name) if name
    attach_file("Salaries", Rails.root + "spec/fixtures/#{salaries_file}") if salaries_file
    attach_file("Rankings", Rails.root + "spec/fixtures/#{rankings_file}") if rankings_file
    click_on("Import")
  end

  def visit_new_dataset_page
    visit root_path
    click_on("Import new datasets")
  end

  def have_message(message)
    have_css('p', text: message)
  end
end
