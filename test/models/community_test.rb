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

require 'test_helper'

class CommunityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
