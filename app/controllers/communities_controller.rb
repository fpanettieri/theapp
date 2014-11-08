class CommunitiesController < ApplicationController
  def map
    @community = Community.find_by_name(params[:name])
  end
end
