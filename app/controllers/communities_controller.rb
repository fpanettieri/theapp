class CommunitiesController < ApplicationController
  def map
    # replace this filter 
    @loc = hot_locations
    gon.locations = @loc.as_json(:only => [:id, :latitude, :longitude])
    gon.locations_path = locations_path
  end
  
  private
  def hot_locations
    # TODO: implement real "hot" filter
    Location.all
  end
end
