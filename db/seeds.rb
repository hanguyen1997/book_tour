Category.delete_all
Category.create!([
  {name: "Vietnam Tour", description: Faker::Lorem.sentence},
  {name: "World Tour", description: Faker::Lorem.sentence},
  {name: "North Vietnam", description: Faker::Lorem.sentence, parent_id: 1},
  {name: "South Vietnam", description: Faker::Lorem.sentence, parent_id: 1},
  {name: "Central Vietnam", description: Faker::Lorem.sentence, parent_id: 1},
  {name: "Europe", description: Faker::Lorem.sentence, parent_id: 2},
  {name: "Asian", description: Faker::Lorem.sentence, parent_id: 2},
  {name: "Califonia", description: Faker::Lorem.sentence, parent_id: 2},
  {name: "Ha Noi", description: Faker::Lorem.sentence, parent_id: 3},
  {name: "Ho Chi Minh", description: Faker::Lorem.sentence, parent_id: 4},
  {name: "Da Nang", description: Faker::Lorem.sentence, parent_id: 5},
  {name: "Italia", description: Faker::Lorem.sentence, parent_id: 6},
  {name: "France", description: Faker::Lorem.sentence, parent_id: 6},
  {name: "Korea", description: Faker::Lorem.sentence, parent_id: 7},
  {name: "Japan", description: Faker::Lorem.sentence, parent_id: 7}
])

Tour.delete_all
13.times{
  image = File.open(File.join(Rails.root, "app/assets/images/da-nang.jpg"))
  Tour.create!(
    name: Faker::Coffee.blend_name,
    rating: 0,
    image: image,
    itinerary: Faker::Lorem.sentence,
    content: Faker::Lorem.paragraph,
    category_id: Faker::Number.between(1, 15)
  )
}

DescriptionDetail.delete_all
30.times do
  day = Faker::Date.forward(10)
  DescriptionDetail.create!(
    price: Faker::Number.decimal(2),
    start_day: day ,
    end_day: day + 5.days,
    tour_id: Faker::Number.between(1, 13)
  )
end

User.delete_all
10.times do |n|
  User.create!(
    name: Faker::Name.name,
    email: "example-#{n+1}@gmail.com",
    password: "123456",
    password_confirmation: "123456",
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.phone_number,
    role: 0
  )
end

Booking.delete_all
30.times{
  Booking.create!(
    status: 0,
    price: Faker::Number.decimal(2),
    quantity: Faker::Number.between(1, 5),
    user_id: Faker::Number.between(1, 10),
    description_detail_id:Faker::Number.between(1, 10)
  )
}

Review.delete_all
50.times{
  Review.create!(
    content: Faker::Lorem.paragraph,
    user_id: Faker::Number.between(1, 10),
    tour_id: Faker::Number.between(1, 10)
  )
}

Comment.delete_all
40.times{
  Comment.create!(
    content: Faker::Lorem.paragraph,
    user_id: Faker::Number.between(1, 10),
    review_id: Faker::Number.between(1, 3)
  )
}