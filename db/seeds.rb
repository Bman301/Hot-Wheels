require 'faker'
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
carImages = ["https://bit.ly/34nxkbX", "https://bit.ly/3vqhoSa", "https://bit.ly/3fNhEUD", "https://bit.ly/3ui9nxe", "https://bit.ly/3wBIRAw", "https://bit.ly/3yFGbne", "https://bit.ly/3hVkIkk", "https://bit.ly/34gzUR0", "https://bit.ly/2SyoPYE", "https://wallpapercave.com/wp/8K3mVCl.jpg", "https://bit.ly/3oQ8MBR", "https://bit.ly/3fLtWg7", "https://wallpaperaccess.com/full/1333809.jpg", "https://bit.ly/3vomI8p", "https://bit.ly/3yEax9C", "https://bit.ly/3bVsxml", "https://bit.ly/3oQMEHk"]
locations = ["Álvaro Obregón, Mexico City", "Polanco, Mexico City", "San Pedro de los Pinos, Mexico City", "Santa María La Ribera, Mexico City", "Roma Norte, Mexico City", "Del Valle Centro, Mexico City", "Agrícola Oriental, Mexico City", "Narvarte Poniente, Mexico City", "Agrícola Pantitlán, Mexico City", "Condesa, Mexico City", "Ampliación Granada, Mexico City", "Tlalpan, Mexico", "Iztacalco, Mexico City", "Benito Juárez, Mexico City"]

10.times do
  Car.create!(
    model: Faker::Vehicle.model,
    brand: Faker::Vehicle.make,
    year: rand(1980..2021),
    location: locations.sample,
    title: Faker::FunnyName.name,
    price: rand(100..1000),
    description: Faker::Vehicle.standard_specs.join,
    user_id: rand(firstId..lastId),
    review: Faker::Quote.robin,
    photo: carImages.sample
  )
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
