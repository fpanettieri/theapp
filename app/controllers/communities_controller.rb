class CommunitiesController < ApplicationController
  def map
    # replace this filter 
    @loc = hot_locations
    gon.locations = @loc.as_json(:only => [:latitude, :longitude])
  end
  
  private
  def hot_locations
    # TODO: implement real "hot" filter
    Location.all
  end
end
