class CreateRailwayRoute < ActiveRecord::Migration[5.1]
  def change
    create_table :railway_routes do |t|
      t.string :name

      t.timestamps
    end
  end
end
