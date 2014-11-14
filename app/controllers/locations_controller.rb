class LocationsController < ApplicationController
  def show
    @location = Location.find(params[:id])
    @location.distance = 12.32 # calculate this?
    @topics = @location.topics.order("votes desc")
  end
  
  def new
    @location = Location.new
  end
  
  def create
    location = Location.new
    location.name = params[:name]
    location.longitude = 0
    location.latitude = 0
    location.address = params[:address]
    location.hours = params[:hours]
    location.detail = params[:detail]
    location.save
    gon.return_url = "/c/bitcoin/list"
  end
end
