class AddSeatsToCarriages < ActiveRecord::Migration[5.1]
  def change
    add_column :carriages, :top, :integer
    add_column :carriages, :bottom, :integer
  end
end
