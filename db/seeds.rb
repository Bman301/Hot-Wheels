require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    phone: Faker::PhoneNumber.cell_phone
  )
end

10.times do
  Car.create(
    model: Faker::Vehicle.model,
    brand: Faker::Vehicle.make,
    year: rand(1980..2021),
    location: Faker::Address.street_address,
    title: Faker::FunnyName.name,
    price: rand(100..1000),
    description: Faker::Lorem.sentence(word_count: 10)
  )
end

statusAvail = ["Available", "Busy"]

10.times do
  Booking.create(
    status: statusAvail.sample,
    start_date: Faker::Date.backward(days: 1),
    end_date: Faker::Date.forward(days: 3),
    pickup_location: Faker::Address.street_address,
    comment: Faker::Lorem.sentence(word_count: 10)
  )
end
