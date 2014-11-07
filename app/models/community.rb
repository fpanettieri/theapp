# == Schema Information
#
# Table name: communities
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  name        :string(255)
#  description :text
#  color       :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Community < ActiveRecord::Base
  has_many :users, through: :community_users
  has_many :categories
end
