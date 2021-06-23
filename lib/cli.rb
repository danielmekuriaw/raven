require_relative '../config/environment'
require_relative '../lib/user.rb'

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
            menu.choice "View my tickets", -> {}
            menu.choice "Profile", -> {}
            menu.choice "All Airlines", -> {} #Search airline
            menu.choice "All prices", -> {}
            menu.choice "Reviews", -> {}
            menu.choice "Change Ticket", -> {}
            menu.choice "Cancel Ticket", -> {}
            menu.choice "Exit", -> {Interface.new.new_or_returning}
        end
    end


end