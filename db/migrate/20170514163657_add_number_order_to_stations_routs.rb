class AddNumberOrderToStationsRouts < ActiveRecord::Migration[5.1]
  def change
    add_column :railway_stations_routes, :number_order, :integer
  end
end
