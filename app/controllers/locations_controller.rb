class LocationsController < ApplicationController
  def show
    @location = Location.eager_load(:topics).find(params[:id])
    @location.distance = 12.32
  end
end
