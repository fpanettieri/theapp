# == Schema Information
#
# Table name: categories
#
#  id           :integer          not null, primary key
#  community_id :integer
#  template_id  :integer
#  name         :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
