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

require 'test_helper'

class TopicTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
