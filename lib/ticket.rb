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

end