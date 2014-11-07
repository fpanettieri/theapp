# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  topic_id   :integer
#  user_id    :integer
#  parent_id  :integer
#  votes      :integer
#  content    :text
#  created_at :datetime
#  updated_at :datetime
#

class Comment < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user
  
  has_many :childs, class_name: "Comment", foreign_key: "parent_id"
  belongs_to :comment, class_name: "Comment"
end
