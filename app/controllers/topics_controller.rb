class TopicsController < ApplicationController
  def show
    @topic = Topic.eager_load(:comments).find(params[:id])  
  end
  
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
