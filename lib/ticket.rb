#  user_id(integer, foreign key), Airline_id(integer, foreign key), prices (integer), ticket_number (integer), baggage (integer)
class Ticket < ActiveRecord::Base

    # attr_reader :user_id, :airline_id
    # attr_accessor :prices, :ticket_number, :baggage

    # def initialize(user_id, airline_id, price, ticket_number, baggage)
    #     @user_id = user_id
    #     @airline_id = airline_id
    #     @price = price
    #     @ticket_number = ticket_number
    #     @baggage = baggage
    # end

    belongs_to :airline
    belongs_to :user

    def ticket_information

        name = "Airline Name: " + self.airline.name
        id = "Airline ID: " + self.airline_id.to_s
        price = "Price: $" + self.price.to_f.to_s
        separator = "-----------------------------------------"
        tick_num = "Ticket Number: " + self.ticket_number
        baggage = "Baggage: " + self.baggage.to_s + " kg"
        space = " "
        origin = "Origin: " + self.origin
        destination = "Destination: " + self.destination
        departure_time = "Departure Time:" + self.departure_time
        arrival_time = "Arrival Time: " + self.arrival_time
        date_of_travel = "Date of Travel: " + self.date_of_travel
        #duration_of_flight = "Duration of Flight: " + self.duration_of_flight

        ticket_box = TTY::Box.frame "Raven",separator, space, name, id, space, price, separator, separator, tick_num, separator, separator, baggage,
        space, origin, destination, separator, departure_time, arrival_time, separator, date_of_travel, padding: 1, align: :center
        print ticket_box

    end

    def ticket_info 
        name = "Airline Name: " + self.airline.name
        id = "Airline ID: " + self.airline_id.to_s
        price = "Price: $" + self.price.to_f.to_s
        separator = "-----------------------------------------"
        tick_num = "Ticket Number: " + self.ticket_number.to_s
        baggage = "Baggage: " + self.baggage.to_s + " kg"
        space = " "

        return name, id, price, tick_num, baggage
       
    end

    def cancel_ticket 
        self.destroy
        Interface.cancel_success_interface
    end

    

end