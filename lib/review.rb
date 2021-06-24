class Review < ActiveRecord::Base

    belongs_to :airline
    belongs_to :user


end