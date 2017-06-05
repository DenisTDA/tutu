class RenamePassengersTableToUsers < ActiveRecord::Migration[5.1]
  def self.up
    remove_index :tickets, :passenger_id
    rename_table :passengers, :users
    add_index :tickets, :user_id
  end 

  def self.down
    remove_index :tickets, :user_id
    rename_table :users, :passengers
    add_index :tickets, :passenger_id
  end
end
