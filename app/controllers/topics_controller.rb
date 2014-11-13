class TopicsController < ApplicationController
  def show
    @topic = Topic.eager_load(:comments).find(params[:id]) 
    @comments = []
    flatten @topic, 0
  end
  
  def flatten(parent, depth)
    return if parent.comments.empty?
    parent.comments.order("votes desc").each do |comment|
      comment.depth = depth
      @comments << comment unless @comments.include? comment
      flatten comment, depth + 1
    end
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
