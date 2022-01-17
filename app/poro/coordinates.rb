class Coordinates
  attr_reader :lattitude,
              :longitude

  def initialize(location)
    @lattitude = location[:lat]
    @longitude = location[:lng]
  end
end
