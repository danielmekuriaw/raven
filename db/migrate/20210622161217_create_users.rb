class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :employment_status
      t.integer :age
      t.string :purpose_of_travel
    end
  end
end
