# == Schema Information
#
# Table name: community_users
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  community_id :integer
#  admin        :boolean
#  created_at   :datetime
#  updated_at   :datetime
#

class CommunityUsers < ActiveRecord::Base
  belongs_to :user
  belongs_to :community
end
