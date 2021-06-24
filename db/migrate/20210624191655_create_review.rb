class CreateReview < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :airline_id
      t.string :description_of_review
      t.integer :rating
    end
  end
end
