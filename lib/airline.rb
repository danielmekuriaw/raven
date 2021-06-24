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

    has_many :tickets
    has_many :reviews
    has_many :users, through: :tickets
    has_many :users, through: :reviews

end