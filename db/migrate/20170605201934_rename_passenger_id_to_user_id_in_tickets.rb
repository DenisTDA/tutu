class RenamePassengerIdToUserIdInTickets < ActiveRecord::Migration[5.1]
  def change
    rename_column :tickets, :passenger_id, :user_id 
    add_index :tickets, :user_id 
  end
end
