class CommunitiesController < ApplicationController
  before_action :prepare_paths, only: [:map, :list, :feed]
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
  def prepare_paths
    gon.locations_path = locations_path
    gon.list_path = url_for controller: 'communities', action: 'list'
    gon.map_path = url_for controller: 'communities', action: 'map'
    gon.feed_path = url_for controller: 'communities', action: 'feed'
  end
  
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
