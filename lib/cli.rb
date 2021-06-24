require_relative '../config/environment'
require_relative '../lib/user.rb'
require_relative '../lib/airline.rb'

class Interface

attr_accessor :prompt, :user

    def initialize
        @prompt = TTY::Prompt.new
    end

    def greeting
        puts "Welcome to Raven! A new innovative way to purchase plane tickets!"
    end

    def new_or_returning
        answer = self.prompt.select("Are you a new or returning user?") do |menu|
            menu.choice "New User", -> {User.handle_new_user}
            menu.choice "Returning User", -> {User.handle_returning_user}
        end
    end

    def user
    end

    def main_menu
        answer = self.prompt.select("What are you here for?") do |menu|
            menu.choice "Purchase a ticket", -> {self.purchase_ticket_interface}
            menu.choice "View my tickets", -> {User.current_user.my_tickets}
            menu.choice "Profile", -> {User.current_user.profile}
            menu.choice "All Airlines", -> {puts Airline.all.map{|airline| airline.name}} #Search airline
            menu.choice "All prices", -> {puts Ticket.all.map{|ticket| ticket.prices}}
            menu.choice "Reviews", -> {puts Airline.all.map{|airline| airline.reviews}}
            menu.choice "Change Ticket", -> {puts User.all.map{|user| user.first_name}} #Jacqualine
            menu.choice "Cancel Ticket", -> {puts User.all.map{|user| user.last_name}} #Dickens
            menu.choice "Exit", -> {Interface.new.new_or_returning}
        end
    end

    def purchase_ticket_interface
        #     @user_id = user_id #HAVE IT
#     @airlines_id = airlines_id #HAVE IT
#     @prices = prices #DON'T KNOW PRICE - AUTO GENERATED
#     @ticket_number = ticket_number #AUTO GENERATED
#     @baggage = baggage #USer inputs

        answer = self.prompt.select("Hi #{User.current_user.first_name}! Pick an Airline") do |menu|
            Airline.all.map{
                |airline|
                menu.choice airline.name, -> {User.current_user.purchase_ticket(airline.id)}
            }
        end
    end



end