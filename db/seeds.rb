require 'faker'
require "open-uri"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    phone: Faker::PhoneNumber.cell_phone,
    password: 123456
  )
end

firstId = User.first.id
lastId = User.last.id
carImages = ["https://cdn.cheapism.com/images/28598349912_556032b482_k.max-784x410.jpg","https://cdn.cheapism.com/images/Rusty-s_TV_and_Movie_Car_Museum_Jackson_TN_0.max-784x410.jpg","https://cdn.cheapism.com/images/032718_cars_we_would_like_to_see_again_slide.max-784x410.jpg", "https://cdn.cheapism.com/images/101018_greatest_movie_tv_cars_slide_4_fs.max-784x410.jpg", "https://cdn.cheapism.com/images/1635px-Herbie_film_car_from_The_Love_Bug.max-784x410.jpg", "https://cdn.cheapism.com/images/101018_greatest_movie_tv_cars_slide_6_fs.max-784x410.jpg", "https://cdn.cheapism.com/images/1623px-1959_Cadillac_Ecto-1_12227773836.max-784x410.jpg", "https://cdn.cheapism.com/images/101018_greatest_movie_tv_cars_slide_10_fs.max-784x410.jpg", "https://cdn.cheapism.com/images/101018_greatest_movie_tv_cars_slide_13_fs.max-784x410.jpg", "https://cdn.cheapism.com/images/101018_greatest_movie_tv_cars_slide_15_fs.max-784x410.jpg"]
locations = ["Álvaro Obregón, Mexico City", "Polanco, Mexico City", "San Pedro de los Pinos, Mexico City", "Santa María La Ribera, Mexico City", "Roma Norte, Mexico City", "Del Valle Centro, Mexico City", "Agrícola Oriental, Mexico City", "Narvarte Poniente, Mexico City", "Agrícola Pantitlán, Mexico City", "Condesa, Mexico City", "Ampliación Granada, Mexico City", "Tlalpan, Mexico", "Iztacalco, Mexico City", "Benito Juárez, Mexico City"]

10.times do

  file = URI.open(carImages.sample)
  car = Car.new(
    model: Faker::Vehicle.model,
    brand: Faker::Vehicle.make,
    year: rand(1980..2021),
    location: locations.sample,
    title: Faker::FunnyName.name,
    price: rand(100..1000),
    description: Faker::Vehicle.standard_specs.join,
    user_id: rand(firstId..lastId),
    review: Faker::Quote.robin,
  )
  car.photo.attach(io: file, filename: carImages.sample, content_type: 'image/jpg')
  car.save
end

statusAvail = ["Available", "Busy"]
carFirst = Car.first.id
carLast = Car.last.id

trueFalse = ["true", "false"]

10.times do
  Booking.create!(
    status: statusAvail.sample,
    start_date: Faker::Date.backward(days: 1),
    end_date: Faker::Date.forward(days: 3),
    pickup_location: Faker::Address.street_address,
    user_id: rand(firstId..lastId),
    car_id: rand(carFirst..carLast),
    insurance: trueFalse.sample
  )
end
