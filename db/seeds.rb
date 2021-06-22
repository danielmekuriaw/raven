puts "Delete tickets!"
Ticket.destroy_all
puts "Delete airlines!"
Airline.destroy_all
puts "Delete users!"
User.destroy_all


puts "Creating airlines..."

30.times do
  Airline.create(name: Faker::Company.name, number_of_destinations: rand(1..200), ratings: rand(0..10), localized: ["domestic", "international"].sample, reviews: Faker::Quote.famous_last_words, description: Faker::Quote.most_interesting_man_in_the_world)
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
  Ticket.create(user_id: User.ids.sample, airlines_id: Airline.ids.sample, prices: rand(1..5000), ticket_number: Faker::IDNumber.valid, baggage: rand(0..200))
end

puts "Done creating tickets.."