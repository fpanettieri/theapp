class TopicsController < ApplicationController
  def show
    @topic = Topic.eager_load(:comments).where('parent_id IS NULL').find(params[:id])
    @comments = []
    flatten @topic, 0
  end
  
  def new
    @topic = Topic.new
    @locations = Location.all
    @categories = Category.all
    if params.has_key? :location_id
      @location = Location.find(params[:location_id])
    else 
      @location = nil
    end
  end
  
  def create
    p "-----------------------------------------------"
    p "-----------------------------------------------"
    p "-----------------------------------------------"
    p "-----------------------------------------------"
    
    p params[:category]
    p params[:location]
    p params[:subject]
    p params[:content]
    
    p "-----------------------------------------------"
    p "-----------------------------------------------"
    p "-----------------------------------------------"
    p "-----------------------------------------------"
    topic = Topic.new
    topic.category_id = Category.where(name: "#{params[:category]}").first.id
    topic.location_id = Location.where(name: "#{params[:location]}").first.id
    topic.user_id = random_user.id
    topic.subject = params[:subject]
    topic.votes = 0
    topic.content = params[:content]
    topic.save
    gon.return_url = "#{topics_path}/#{topic.id}"
  end
  
  def comment
    @topic = Topic.find(params[:id])
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
      next if depth.eql? 0 and !comment.parent_id.nil? 
      comment.depth = depth
      @comments << comment unless @comments.include? comment
      flatten comment, depth + 1
    end
  end
  
  def random_user
    User.find(User.pluck(:id).sample)
  end
end
