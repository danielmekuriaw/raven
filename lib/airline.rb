class Airline < ActiveRecord::Base

    # attr_accessor :number_of_destinations, :localized, :description, :ratings, :reviews

    # attr_reader :name

    # def initialize(name, number_of_destinations, localized, description, ratings, reviews)
    #     @name = name
    #     @number_of_destinations = number_of_destinations
    #     @localized = localized
    #     @description = description
    #     @ratings = ratings
    #     @reviews = reviews
    # end

    has_many :tickets # gives us a Driver#rides method
    has_many :users, through: :tickets # gives us a method!!!

end