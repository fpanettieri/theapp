# == Schema Information
#
# Table name: topics
#
#  id             :integer          not null, primary key
#  category_id    :integer
#  location_id    :integer
#  user_id        :integer
#  subject        :string(255)
#  votes          :integer
#  expires        :datetime
#  content        :text
#  comments_count :integer
#  created_at     :datetime
#  updated_at     :datetime
#

class Topic < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  belongs_to :location
  has_many :comments
  
  def self.hot
    Topic.joins(:user).select('topics.id, users.name, topics.subject, topics.votes, topics.created_at').order('topics.votes desc')
  end
end
