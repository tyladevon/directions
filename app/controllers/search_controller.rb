class SearchController < ApplicationController
  def index 
    render locals: {
      station: SearchFacade.new(params[:location]).find_nearest_station,
      directions: SearchFacade.new(params[:location]).find_directions,
      top_stations: SearchFacade.new(params[:location]).top_three
    }
  end
end 