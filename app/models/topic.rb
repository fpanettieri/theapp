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
end
