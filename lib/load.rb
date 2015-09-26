class Load
  def initialize(dataset, transformation)
    @dataset = dataset
    @transformation = transformation
  end

  def store_in_activerecord
    @transformation.each do |player|
      name             = player[:name]
      position         = player[:position]
      salary           = player[:salary]
      projected_points = player[:projected_points]
      price_per_point  = player[:price_per_point]

      Player.find_or_create_by(dataset_id: dataset.id, name: name, position: position, salary: salary, projected_points: projected_points, price_per_point: price_per_point)
    end
  end

  private

  attr_reader :dataset
end
