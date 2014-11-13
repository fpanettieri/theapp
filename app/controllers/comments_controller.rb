class CommentsController < ApplicationController
  def comment
    @comment = Comment.find(params[:id])
    @topic = @comment.topic
  end
  
  def post_comment
    parent = Comment.find(params[:parent])
    topic = parent.topic
    comment = Comment.new
    comment.topic_id = topic.id
    comment.user_id = random_user.id
    comment.parent_id = params[:parent]
    comment.votes = 0
    comment.content = params[:content]
    comment.save
    gon.return_url = "#{topics_path}/#{topic.id}"
  end
  
  def upvote
    comment = Comment.find(params[:id])
    comment.votes += 1
    comment.save
    gon.return_url = params[:return_url]
  end
  
  def downvote
    comment = Comment.find(params[:id])
    comment.votes -= 1
    comment.save
    gon.return_url = params[:return_url]
  end
  
  private
  def random_user
    User.find(User.pluck(:id).sample)
  end
end
