class User < ActiveRecord::Base

    # def initialize(first_name, last_name, employment_status, age, purpose_of_travel)
    #     # @first_name = first_name
    #     # @last_name = last_name
    #     # @employment_status = employment_status
    #     # @age = age
    #     # @purpose_of_travel = purpose_of_travel
    # end


    @@current_user = nil

    has_many :tickets # gives us a method!!!! 
    has_many :airlines, through: :tickets # also gives us a method :D Passenger#drivers

    def self.handle_returning_user
        puts "First Name: "
        first_name = gets.chomp
        puts "Last Name: "
        last_name = gets.chomp

        selected_user = User.find_by(first_name: first_name, last_name: last_name)

        @@current_user = selected_user
    end

    def self.handle_new_user
        puts "Welcome New User! This is Raven, a new innovative application to purchase plane tickets."
        puts "What is your first name?"
        first_name = gets.chomp
        puts "What is your last name?"
        last_name = gets.chomp
        puts "What is your employment status?"
        employment_status = gets.chomp
        puts "What is your age?"
        age = gets.chomp
        puts "What is your purpose of travel?"
        purpose_of_travel = gets.chomp
       
        @@current_user = User.create(first_name: first_name, last_name: last_name, employment_status: employment_status, age: age, purpose_of_travel: purpose_of_travel)
    end

    def my_tickets
         Ticket.all.select{
            |ticket| ticket.user_id == self.id}.map{ |ticket| ticket.ticket_information}
    end

    

    def self.current_user
        @@current_user
    end

    

    def profile
        puts "First Name: " + self.first_name 
        puts "Last Name: " + self.last_name
        puts "Age: " + self.age.to_s
        puts "Employment Status: " + self.employment_status
        puts "Purpose of Travel: " + self.purpose_of_travel
    end

    def purchase_ticket(airlines_id)
    #     @prices = prices #random auto generate
    #     @ticket_number = ticket_number #AUTO GENERATED
    #     @baggage = baggage #USer inputs

        #answer = Interface.prompt.select("Hi #{self.first_name}! Pick an Airline") do |menu|
            #menu.choice "Purchase a ticket", -> {}


        puts "Baggage amount: "
        baggage_amount = gets.chomp

        ticket = Ticket.new({:user_id => self.id, :airlines_id => airlines_id, :prices => rand(1..5000), :ticket_number =>Faker::IDNumber.valid, :baggage => baggage_amount})
        ticket.save
    end


    
end