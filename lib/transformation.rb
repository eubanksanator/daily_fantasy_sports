class Transformation
  def initialize(extraction)
    @extraction = extraction
  end

  def output
    transform
  end

  private

  def transform
    @extraction
  end
end
