class Player < ActiveRecord::Base
  belongs_to :dataset

  validates :name, presence: true
  validates :position, presence: true
  validates :salary, presence: true, numericality: true
  validates :projected_points, presence: true, numericality: true
  validates :price_per_point, presence: true, numericality: true
end
