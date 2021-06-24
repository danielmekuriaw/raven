class Airline < ActiveRecord::Base

    has_many :tickets
    has_many :reviews
    has_many :users, through: :tickets
    has_many :users, through: :reviews

end