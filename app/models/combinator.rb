class Combinator
  attr_reader :data

  def initialize(data, config)
    @data = data
    @config = config
  end

  def output_data
    data.each { |player| puts player.name }
  end
end
