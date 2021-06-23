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
            menu.choice "Purchase a ticket", -> {}
            menu.choice "View my tickets", -> {User.current_user.my_tickets}
            menu.choice "Profile", -> {User.current_user.profile}
            menu.choice "All Airlines", -> {puts Airline.all.map{|airline| airline.name}} #Search airline
            menu.choice "All prices", -> {puts Ticket.all.map{|ticket| ticket.prices}}
            menu.choice "Reviews", -> {puts Airline.all.map{|airline| airline.reviews}}
            menu.choice "Change Ticket", -> {}
            menu.choice "Cancel Ticket", -> {}
            menu.choice "Exit", -> {Interface.new.new_or_returning}
        end
    end


end