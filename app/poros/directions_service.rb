class DirectionsService
  def initialize(origin, destination)
    @origin = origin
    @destination = destination
  end

  def search 
    results = conn.get("maps/api/directions/json") do |req|
      req.params['key'] = ENV['GOOGLE_API_KEY']
      req.params['origin'] = @origin
      req.params['destination'] = @destination
    end 
    JSON.parse(results.body, symbolize_names: true)
  end 

  private 

  def conn 
    Faraday.new(url: "https://maps.googleapis.com")
  end 
end