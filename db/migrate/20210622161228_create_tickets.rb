class CreateTickets < ActiveRecord::Migration[6.1]
  def change
    create_table :tickets do |t|
      t.integer :user_id
      t.integer :airlines_id
      t.integer :prices
      t.integer :ticket_number
      t.integer :baggage
    end
  end
end
