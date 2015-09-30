class Combinator
  attr_reader :data, :config

  def initialize(args)
    default_config = {
                       "QB"   => 1,
                       "RB"   => 2,
                       "WR"   => 3,
                       "TE"   => 1,
                       "Flex" => 1,
                       "DST"  => 1,
                     }

    @data   = args[:data]
    @config = args[:config] || default_config
  end

  def output_data
    data
  end
end
