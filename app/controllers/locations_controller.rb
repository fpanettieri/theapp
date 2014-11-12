class LocationsController < ApplicationController
  def show
    @location = Location.find(params[:id])
    @location.distance = 12.32 # calculate this?
    @topics = @location.topics.order("votes desc")
  end
end
