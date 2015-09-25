class Dataset < ActiveRecord::Base
  mount_uploader :salaries, SalariesUploader
  mount_uploader :rankings, RankingsUploader

  validates :salaries, presence: true
  validates :rankings, presence: true
  validates :name, presence: true
end
