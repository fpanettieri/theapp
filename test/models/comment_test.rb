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

require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
