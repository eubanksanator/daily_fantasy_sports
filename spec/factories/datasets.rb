FactoryGirl.define do
  factory :dataset do
    id 10
    name 'DraftKingsWeek1'
    rankings_filename 'example_rankings.csv'
    salaries_filename 'example_salaries.csv'
    rankings Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/example_rankings.csv')))
    salaries Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/example_salaries.csv')))
  end
end
