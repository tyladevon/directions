class Direction
  attr_reader :distance, :travel_time, :directions
  def initialize(data)
    @distance = data[:routes][0][:legs][0][:distance][:text]
    @travel_time = data[:routes][0][:legs][0][:duration][:text]
    @directions= data[:routes][0][:legs][0][:steps][1][:html_instructions]
  end 
end