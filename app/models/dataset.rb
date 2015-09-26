class Dataset < ActiveRecord::Base
  has_many :players

  mount_uploader :salaries, SalariesUploader
  mount_uploader :rankings, RankingsUploader

  validates :salaries, presence: true
  validates :rankings, presence: true
  validates :name, presence: true
end
