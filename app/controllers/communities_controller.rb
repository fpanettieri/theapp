class CommunitiesController < ApplicationController
  def map
    @cname = params[:name]
  end
end
