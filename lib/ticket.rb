#  user_id(integer, foreign key), Airlines_id(integer, foreign key), prices (integer), ticket_number (integer), baggage (integer)
class Ticket < ActiveRecord::Base

    # attr_reader :user_id, :airlines_id
    # attr_accessor :prices, :ticket_number, :baggage

    # def initialize(user_id, airlines_id, prices, ticket_number, baggage)
    #     @user_id = user_id
    #     @airlines_id = airlines_id
    #     @prices = prices
    #     @ticket_number = ticket_number
    #     @baggage = baggage
    # end

    belongs_to :airline
    belongs_to :user

    def all_ticket_prices
        puts "HAPPENED!!!"
      puts  Ticket.all.prices
    end

    def ticket_information
        # puts "User Id:" + self.user_id.to_s
        puts "Airlines Id: " + self.airlines_id.to_s
        puts "Prices: $" + self.prices.to_f.to_s
        puts "Ticket Number: " + self.ticket_number.to_s
        puts "Baggage: " + self.baggage.to_s
        puts "-----------------------------------------"
    end

end