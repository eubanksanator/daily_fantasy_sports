class PlayersLoader
  attr_reader :dataset

  def initialize(dataset)
    @dataset = dataset
  end

  def save
    @dataset.save && db_load
  end

  private

  def db_load
    extraction = Extraction.new(@dataset.salaries.current_path, @dataset.rankings.current_path)
    transformation = Transformation.new(extraction.output)
    Load.new(@dataset, transformation.output).store_in_activerecord
  end
end



