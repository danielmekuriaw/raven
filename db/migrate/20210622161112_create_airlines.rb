class CreateAirlines < ActiveRecord::Migration[6.1]
  def change
    create_table :airlines do |t|
      t.string :name
      t.integer :number_of_destinations
      t.string :localized
      t.string :description 
    end
  end
end
