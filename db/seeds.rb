# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
User.delete_all
Event.delete_all
Attendance.delete_all

10.times do
  User.create!(
    email: Faker::Internet.username(specifier: 5..8) + "@yopmail.com",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Lorem.sentence
  )
end

puts "10 utilisateurs créés"

3.times do
  Event.create!(
    start_date: Faker::Date.between(from: Date.today, to: 1.year.from_now) ,
    duration: Faker::Number.number(digits: 2),
    title: Faker::Lorem.sentence(word_count: 3) ,
    description: Faker::Lorem.paragraphs(number: 1),
    price: Faker::Number.number(digits: 2),
    location: Faker::Address.city,
    admin_id: User.find(rand(User.first.id..User.last.id)).id,
    participant_id: User.find(rand(User.first.id..User.last.id)).id
  )
end

puts "Events created"

3.times do
  Attendance.create!(stripe_customer_id:"qsjdhqsjd",
    user_id: User.find(rand(User.first.id..User.last.id)).id,
    event_id: Event.find(rand(Event.first.id..Event.last.id)).id
  )
end

puts "Attendances created"
