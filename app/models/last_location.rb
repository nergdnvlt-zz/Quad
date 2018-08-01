class LastLocation
  attr_reader :id,
              :location_latitude,
              :location_longitude,
              :distance,
              :time

  def initialize(attrs)
    @id = attrs[:id]
    @location_latitude = attrs[:lat]
    @location_longitude = attrs[:long]
    @distance = attrs[:distance]
    @time = attrs[:timestamp]
  end
end
