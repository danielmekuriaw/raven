class Ticket < ActiveRecord::Base

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
        

        ticket_box = TTY::Box.frame "Raven",separator, space, name, id, space, price, separator, separator, tick_num, separator, separator, baggage,
        space, origin, destination, separator, departure_time, arrival_time, separator, padding: 1, align: :center
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

    def cancel_ticket(cli) 
        self.destroy
        cli.success_interface("Ticket Cancelled Successfully!")
    end

    

end