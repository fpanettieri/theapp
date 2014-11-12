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
  has_many :topics
  
  attr_accessor :distance
  
  def calc_distance lon, lat
    @distance = distance_from([lat,lon]).round(2)
  end
  
  def self.hot_map(lon, lat)
    sort_by_distance(Location.all, lon, lat)
  end
  
  def self.hot_list(lon, lat)
    sort_by_distance(Location.all, lon, lat)
  end
  
  def self.sort_by_distance(locs, lon, lat)
    locs.each{|l| l.calc_distance(lon,lat)}.sort_by!{|l| l.distance }
  end
end
