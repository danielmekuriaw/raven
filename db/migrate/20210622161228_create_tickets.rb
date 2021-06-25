class CreateTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :tickets do |t|
      t.integer :user_id
      t.integer :airline_id
      t.integer :price
      t.string :ticket_number
      t.integer :baggage
      t.string :origin
      t.string :destination 
      t.string :departure_time
      t.string :arrival_time
    end
  end
end
