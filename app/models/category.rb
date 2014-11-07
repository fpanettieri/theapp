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

class Category < ActiveRecord::Base
  belongs_to :community
  belongs_to :template
  has_many :topics
end
