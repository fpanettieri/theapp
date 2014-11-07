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

require 'test_helper'

class CommunityUsersTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
