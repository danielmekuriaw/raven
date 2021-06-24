require_relative '../config/environment'
require_relative '../lib/user.rb'
require_relative '../lib/airline.rb'

class Interface

attr_accessor :prompt, :user

    def initialize
        @prompt = TTY::Prompt.new
    end

    def raven_print
        font = TTY::Font.new(:doom)
        puts font.write("RAVEN", letter_spacing: 4)
    end

    def greeting
        self.raven_print
        puts "Welcome to Raven! A new innovative way to purchase and manage your plane tickets!"
    end

    def new_or_returning
        answer = self.prompt.select("Are you a new or returning user?") do |menu|
            menu.choice "New User", -> {User.handle_new_user(self)}
            menu.choice "Returning User", -> {User.handle_returning_user}
            menu.choice "Exit", -> {exit}
        end
    end

    def main_menu
        answer = self.prompt.select("Main Menu") do |menu|
            menu.choice "Profile", -> {User.current_user.profile} #DONE
            menu.choice "View my tickets", -> {User.current_user.my_tickets_display} #DONE
            menu.choice "Purchase a ticket", -> {self.purchase_ticket_interface} #DONE
            menu.choice "Cancel Ticket", -> {self.cancel_ticket_interface} #DONE
            menu.choice "All Airlines", -> {self.all_airlines_interface} #DONE #Search airline
            menu.choice "All Prices", -> {self.all_prices_interface} #DONE
            menu.choice "Add a Review", -> {self.add_review_interface} #DONE
            menu.choice "Delete Account", -> {self.delete_user_interface} #DONE
            menu.choice "Log Out", -> {Interface.new.new_or_returning} #DONE
        end
    end

    def purchase_ticket_interface

        answer = self.prompt.select("Hi #{User.current_user.first_name}! Pick an Airline") do |menu|
            Airline.all.map{
                |airline|
                menu.choice airline.name, -> {User.current_user.purchase_ticket(airline.id, self)}
            }
                menu.choice "Cancel", -> {self.main_menu}
        end
    end

    def success_interface(sentence)
        success_box = TTY::Box.success(sentence)
        print success_box
    end

    def purpose_of_travel_interface
        answer = self.prompt.select("Purpose of travel: ") do |menu|
            menu.choice "Business", -> {return "business"}
            menu.choice "Vacation", -> {return "vacation"}
        end
    end

    def all_airlines_interface

        table = TTY::Table.new(header: ["ID", "Airlines", "Num. of Dest.", "Type"]) do |t|
            Airline.all.each{
                |airline|

                airline_attributes_array = Array.new 
                airline_attributes_array << airline.id
                airline_attributes_array << airline.name
                airline_attributes_array << airline.number_of_destinations
                airline_attributes_array << airline.localized.capitalize()
                t << airline_attributes_array
            }
            
          end

        puts table.render(:ascii, alignments: [:center, :center, :center, :center, :center])

    end

    def all_prices_interface
        table = TTY::Table.new(header: ["Airlines", "Prices"]) do |t|
            Ticket.all.each{
                |ticket|
                ticket_attributes_array = Array.new 
                ticket_attributes_array << ticket.airline.name
                ticket_attributes_array << "$ " + ticket.price.to_f.to_s
                t << ticket_attributes_array
            }
        end

    puts table.render(:ascii, alignments: [:center, :center])
    end

    def cancel_ticket_interface

        answer = self.prompt.select("Hi #{User.current_user.first_name}! Select one of your tickets.") do |menu|
            User.current_user.my_tickets.map{
                |ticket|
                menu.choice ticket.ticket_info, -> {ticket.cancel_ticket(self)}
            }
                menu.choice "Cancel", -> {self.main_menu}
        end

    end

    def delete_user_interface
            answer = self.prompt.select("Hi #{User.current_user.first_name}! Click below to delete your account..") do |menu|
                menu.choice "Delete Account", -> {User.current_user.delete_user(self)}
                menu.choice "Cancel", -> {self.main_menu}
            end
    end

    def airline_description_interface(airline_id)
        a1 = Airline.all.select{
            |airline| airline.id == airline_id
        }
        puts a1[0].name
        puts a1[0].description
        puts "------------------------------------------------"
        
        reviews_of_an_airline = Review.all.select{
            |review| review.airline_id == airline_id
        }

        table = TTY::Table.new(header: ["Reviews", "Ratings"]) do |t|
            reviews_of_an_airline.each{ |review|
                reviews_array = Array.new
                reviews_array << review.description_of_review
                reviews_array << review.rating
                t << reviews_array
            }
        end

        puts table.render(:ascii, alignments: [:left, :center])

    end

    def add_review_interface
        answer = self.prompt.select("Hi #{User.current_user.first_name}! Pick an Airline") do |menu|
            Airline.all.map{
                |airline|
                menu.choice airline.name, -> {User.current_user.add_review(airline.id, self, airline)}
            }
                menu.choice "Cancel", -> {self.main_menu}
        end
    end
end