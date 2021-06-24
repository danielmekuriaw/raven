class Review < ActiveRecord::Base

    belongs_to :airline
    belongs_to :user

    #A user has many reviews (can give many reviews)
    #An airline has many reviews from many users

    #SO a has-many-through relationship with the Review class being the joiner class

    # will have a user_id and an airlines_id

    # very similar to the ticket class

end