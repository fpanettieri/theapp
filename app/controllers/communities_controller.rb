class CommunitiesController < ApplicationController
  before_action :prepare_paths, only: [:map]
  
  def map
    @community = params[:name]
    # replace this filter 
    @loc = hot_locations
    gon.locations = @loc.as_json(:only => [:id, :latitude, :longitude])
  end
  
  private
  def hot_locations
    # TODO: implement real "hot" filter
    Location.all
  end
  
  def prepare_paths
    gon.locations_path = locations_path
    gon.list_path = url_for controller: 'communities', action: 'list'
    gon.map_path = url_for controller: 'communities', action: 'map'
    gon.feed_path = url_for controller: 'communities', action: 'feed'
  end
end
