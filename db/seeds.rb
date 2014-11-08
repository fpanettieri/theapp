# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts 'Seeding Superadmin'
root = User.create!(name: 'superadmin', email: 'superadmin@mailinator.com', password: '12341234', password_confirmation: '12341234')

puts 'Seeding Users'
users = []
10.times do
  pass = Faker::Internet.password
  users << User.create!(name: Faker::Name.name, phone: Faker::PhoneNumber.cell_phone, email: Faker::Internet.free_email, password: pass, password_confirmation: pass)
end

puts 'Seeding Community'
community = Community.create!(user_id: root.id, name: 'bitcoin', description: 'Coinding', color: 'ef9327')

puts 'Seeding CommunityUser'
users.each do |user|
  CommunityUser.create!(community_id: community.id, user_id: user.id, admin: false)
end

puts 'Seeding Templates'
templates = [
  Template.create!(name: 'Shop', description: 'Enough information to describe a shop'),
  Template.create!(name: 'Image', description: 'An image with a title')
]

puts 'Seeding Categories'
categories = [
  Category.create!(community_id: community.id, template: templates[0], name: 'Restaurant'),
  Category.create!(community_id: community.id, template: templates[0], name: 'Bar'),
  Category.create!(community_id: community.id, template: templates[0], name: 'Coffee'),
  Category.create!(community_id: community.id, template: templates[0], name: 'Shop'),
  Category.create!(community_id: community.id, template: templates[0], name: 'Online'),
  Category.create!(community_id: community.id, template: templates[0], name: 'BTM')
]

puts 'Seeding Locations'
locations = []
30.times do
  locations << Location.create(name: Faker::Address.street_address, latitude: Faker::Address.latitude, longitude: Faker::Address.longitude)
end

puts 'Seeding Topics'
topics = []
30.times do |i|
  subjects = [Faker::Name.name, Faker::Company.name, Faker::App.name, Faker::Commerce.product_name]
  contents = [Faker::Company.catch_phrase, Faker::Company.bs, Faker::Lorem.sentence, Faker::Hacker.say_something_smart, ]
  topics << Topic.create(category: categories.sample, location: locations.sample, user: users.sample, subject: subjects.sample, votes: Random.new.rand(256), content: contents.sample)
end

