puts "Delete tickets!"
Ticket.destroy_all
puts "Delete airlines!"
Airline.destroy_all
puts "Delete users!"
User.destroy_all
puts "Delete reviews!"
Review.destroy_all


puts "Creating airlines..."

30.times do
  Airline.create(name: Faker::Company.name, number_of_destinations: rand(1..200), localized: ["domestic", "international"].sample,  description: Faker::Company.catch_phrase)
end

puts "Done creating airlines!"

# Users

puts "Creating users..."

30.times do
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, employment_status: Faker::Job.title, age: rand(1..70), purpose_of_travel: ["business", "vacation"].sample)
end

puts "Done creating users!"

# TICKETS

puts "Creating tickets.."

60.times do
  Ticket.create(user_id: User.ids.sample, airline_id: Airline.ids.sample, price: rand(1..5000), ticket_number: Faker::IDNumber.valid, baggage: rand(0..200),
  origin: Faker::Address.country_code_long, destination: Faker::Address.country_code_long, departure_time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :long), arrival_time: Faker::Time.between(from: DateTime.now + 1, to: DateTime.now + 2, format: :long),
  date_of_travel: Faker::Date.between(from: '2021-09-23', to: '2022-09-25').to_s, duration_of_flight: rand(1..24))
end

puts "Done creating tickets.."

# Reviews

120.times do

  Review.create(user_id: User.ids.sample, airline_id: Airline.ids.sample, rating: rand(0..10), description_of_review: Faker::Company.catch_phrase)
end

  puts "Done creating reviews.."

 