class SearchController < ApplicationController
  def index 
    render locals: {
      station: SearchFacade.new(params[:location]).find_nearest_station,
      directions: SearchFacade.new(params[:location]).find_directions
    }
    # render locals: {
    #   station: NearestStationSearch.new(params[:location]).search,
    #   directions: DirectionsSearch.new(params[:location]).search 
    # }
  end
end 