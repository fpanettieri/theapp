class CommentsController < ApplicationController
  def comment
    
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
end
