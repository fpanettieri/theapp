class TopicsController < ApplicationController
  def show
    @topic = Topic.eager_load(:comments).find(params[:id]) 
    @comments = []
    flatten @topic, 0
  end
  
  def comment
    @topic = Topic.find(params[:id])
    @comment = Comment.new
  end
  
  def post_comment
    topic = Topic.find(params[:id])
    comment = Comment.new
    comment.topic_id = topic.id
    comment.user_id = random_user.id
    comment.votes = 0
    comment.content = params[:content]
    comment.save
    gon.return_url = "#{topics_path}/#{topic.id}"
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
  
  private
  def flatten(parent, depth)
    return if parent.comments.empty?
    parent.comments.order("votes desc").each do |comment|
      comment.depth = depth
      @comments << comment unless @comments.include? comment
      flatten comment, depth + 1
    end
  end
  
  def random_user
    User.find(User.pluck(:id).sample)
  end
end
