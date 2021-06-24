class User < ActiveRecord::Base

    # def initialize(first_name, last_name, employment_status, age, purpose_of_travel)
    #     # @first_name = first_name
    #     # @last_name = last_name
    #     # @employment_status = employment_status
    #     # @age = age
    #     # @purpose_of_travel = purpose_of_travel
    # end


    @@current_user = nil

    has_many :tickets
    has_many :reviews # gives us a method!!!! 
    has_many :airlines, through: :tickets # also gives us a method :D Passenger#drivers
    has_many :airlines, through: :reviews

    def self.handle_returning_user
        puts "First Name: "
        first_name = gets.chomp
        puts "Last Name: "
        last_name = gets.chomp

        selected_user = User.find_by(first_name: first_name, last_name: last_name)

        @@current_user = selected_user
    end

    def self.handle_new_user(cli)
        puts "Welcome New User! This is Raven, a new innovative application to purchase plane tickets."
        puts "What is your first name?"
        first_name = gets.chomp
        puts "What is your last name?"
        last_name = gets.chomp
        puts "What is your employment status?"
        employment_status = gets.chomp
        puts "What is your age?"
        age = gets.chomp
        purpose_of_travel = cli.purpose_of_travel_interface
       
        @@current_user = User.create(first_name: first_name, last_name: last_name, employment_status: employment_status, age: age, purpose_of_travel: purpose_of_travel)
    end

    def my_tickets_display
         self.my_tickets.map{ |ticket| ticket.ticket_information}
    end

    def my_tickets
        Ticket.all.select{
           |ticket| ticket.user_id == self.id}
    end

    

    def self.current_user
        @@current_user
    end

    

    def profile
        puts "-----------------------------------------"
        puts "First Name: " + self.first_name 
        puts "Last Name: " + self.last_name
        puts "Age: " + self.age.to_s
        puts "Employment Status: " + self.employment_status
        puts "Purpose of Travel: " + self.purpose_of_travel.capitalize()
        puts "-----------------------------------------"
    end

    def purchase_ticket(airline_id, cli)

        cli.airline_description_interface(airline_id)
        ticket_number = Faker::IDNumber.valid
        origin = Faker::Address.country_code_long
        destination =  Faker::Address.country_code_long
        departure_time = Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :long)
        arrival_time = Faker::Time.between(from: DateTime.now + 1, to: DateTime.now + 2, format: :long)
        date_of_travel =  Faker::Date.between(from: '2021-09-23', to: '2022-09-25')
    
        puts "Ticket Number: " + ticket_number
        puts "Origin: " + origin
        puts "Destination: " + destination
        puts "Departure Time: " + departure_time
        puts "Arrival Time: " + arrival_time
        puts "Date of Travel: " + date_of_travel.to_s
       

        puts "Baggage amount (kg): "
        baggage_amount = gets.chomp
        baggage_amount = baggage_amount.to_s

        ticket = Ticket.new({:user_id => self.id, :airline_id => airline_id, :price => rand(1..5000), :ticket_number =>ticket_number, :baggage => baggage_amount,
        :origin => origin, :destination => destination, :departure_time => departure_time, :arrival_time => arrival_time, :date_of_travel => date_of_travel})
        ticket.save

        cli.purchase_success_interface(ticket)
    end

    def add_review(airline_id, cli, airline)
        cli.airline_description_interface(airline_id)
        
        puts "Hi #{self.first_name}! How do you rate the #{airline.name} out of 10?"
        rating = gets.chomp
        puts "Write your review below and press Enter once you are done: "
        review_desc = gets.chomp

        review = Review.new({:user_id => self.id, :airline_id => airline_id, :description_of_review => review_desc, :rating => rating})
        review.save
        Interface.review_success_interface
    end
    
    def delete_user
        deletion = self.destroy
        exit        
    end



    
end