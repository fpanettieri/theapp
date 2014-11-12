class TopicsController < ApplicationController
  def upvote
    topic = Topic.find(params[:id])
    topic.votes += 1
    topic.save
    gon.return_url = params[:return_url]
  end
  
  def downvote
    topic = Topic.find(params[:id])
    topic.votes -= 1
    topic.save
    gon.return_url = params[:return_url]
  end
end
