# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             mobile: "0451000000", 
             city: "Melbourne",
             admin: true)

User.first.microposts.create!(topic: "Selected", title: "Selected Post", content: "First post just for testing selected post", views_count: 0)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  mobile = "0000000000"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password, 
               mobile: mobile, 
               city: "Melbourne")
end




users = User.order(:created_at).take(6)
10.times do
  topic = "Game"
  title = "game title"
  views_count = 0
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(topic: topic, title: title, content: content, views_count: views_count) }
end

users = User.order(:created_at).take(6)
10.times do
  topic = "A.I."
  title = "A.I. title"
  views_count = 0
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(topic: topic, title: title, content: content, views_count: views_count) }
end

users = User.order(:created_at).take(6)
10.times do
  topic = "RMIT"
  title = "RMIT title"
  views_count = 0
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(topic: topic, title: title, content: content, views_count: views_count) }
end

users = User.order(:created_at).take(6)
10.times do
  topic = "V.R."
  title = "V.R. title"
  views_count = 0
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(topic: topic, title: title, content: content, views_count: views_count) }
end


Topic.create!(name:  "Game", status: 0)

Topic.create!(name:  "A.I.", status: 0)

Topic.create!(name:  "RMIT", status: 0)

Topic.create!(name:  "V.R.", status: 0)

