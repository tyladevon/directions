class SearchFacade
  def initialize(location) 
    @location = location
  end

  def find_nearest_station
    results = NearestStationService.new(@location).search
    Station.new(results[:fuel_stations][0])
  end

  def find_directions
    get_address = find_nearest_station.address.join(",")
    directions = DirectionsService.new(@location, get_address).search
    Direction.new(directions)
  end
end 