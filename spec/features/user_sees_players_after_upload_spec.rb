require 'rails_helper'

feature "User imports datasets" do
  scenario "they see the uploaded players" do
    visit root_path

    click_on("Import new datasets")
    fill_in("Name", with: "DraftKingsWeek2")
    attach_file("Salaries", Rails.root + "spec/fixtures/example_salaries.csv")
    attach_file("Rankings", Rails.root + "spec/fixtures/example_rankings.csv")
    click_on("Import")

    expect(page).to have_content("DraftKingsWeek2")
    expect(page).to have_content("Drew Brees")
    expect(page).to have_content("Andrew Luck")
    expect(page).to have_content("383.4")
  end
end
