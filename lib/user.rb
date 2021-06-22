class User < ActiveRecord::Base

    # def initialize(first_name, last_name, employment_status, age, purpose_of_travel)
    #     # @first_name = first_name
    #     # @last_name = last_name
    #     # @employment_status = employment_status
    #     # @age = age
    #     # @purpose_of_travel = purpose_of_travel
    # end

    has_many :tickets # gives us a method!!!! Passenger#rides
    has_many :airlines, through: :tickets # also gives us a method :D Passenger#drivers

    
end