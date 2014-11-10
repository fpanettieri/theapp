# == Schema Information
#
# Table name: locations
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  latitude   :float
#  longitude  :float
#  address    :string(255)
#  expires    :datetime
#  hours      :string(255)
#  detail     :text
#  created_at :datetime
#  updated_at :datetime
#

class Location < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode
  
  def self.hot_map
    Location.select('id, latitude, longitude')
  end
  
  def self.hot_list
    Location.select('id, name, address')
  end
end
