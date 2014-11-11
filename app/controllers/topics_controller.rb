class TopicsController < ApplicationController
  def upvote
    topic = Topic.find(params[:id])
    topic.votes += 1
    topic.save
  end
  
  def downvote
    topic = Topic.find(params[:id])
    topic.votes -= 1
    topic.save
  end
end
