class PlayersLoader
  def initialize(dataset)
    @dataset = dataset
  end

  def save
    @dataset.save && db_load
  end

  private

  attr_reader :dataset

  def db_load
    extraction = Extraction.new(@dataset.salaries.current_path, @dataset.rankings.current_path)
    transformation = Transformation.new(extraction.output)
    Load.new(transformation.output).store_in_activerecord
  end
end



