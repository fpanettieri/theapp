class CommunitiesController < ApplicationController
  before_action :prepare_location, only: [:map, :list, :feed]
  
  def map
    @community = params[:name]
    @locs = Location.hot_map(@lon, @lat)
    gon.locs = @locs.as_json
  end
  
  def list
    @community = params[:name]
    @locs = Location.hot_list(@lon, @lat)
  end
 
  def feed
    @community = params[:name]
    @top = Topic.hot
  end
  
  private
  def prepare_location
    if request.location.nil?
      @lon = -32
      @lat = -68
    else
      @lon = request.location.longitude
      @lat = request.location.latitude
    end
  end  
end
