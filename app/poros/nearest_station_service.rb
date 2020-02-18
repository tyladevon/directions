class NearestStationService
  def initialize(location) 
    @location = location
  end

  def search
    raw_results = conn.get("/api/alt-fuel-stations/v1/nearest.json") do |req|
      req.params['fuel_type'] = 'ELEC'
      req.params['location'] = @location
      req.params['limit'] = 1
      req.params['api_key'] = ENV['NREL_API_KEY']
    end 
    JSON.parse(raw_results.body, symbolize_names: true) 
  end 

  def find_three
    raw_results = conn.get("/api/alt-fuel-stations/v1/nearest.json") do |req|
      req.params['fuel_type'] = 'ELEC'
      req.params['location'] = @location
      req.params['limit'] = 3
      req.params['api_key'] = ENV['NREL_API_KEY']
    end 
    JSON.parse(raw_results.body, symbolize_names: true)
  end 
  private 
  
  def conn 
    Faraday.new(url: "https://developer.nrel.gov")
  end
end