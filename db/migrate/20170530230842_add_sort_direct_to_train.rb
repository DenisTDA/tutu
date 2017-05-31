class AddSortDirectToTrain < ActiveRecord::Migration[5.1]
  def change
    add_column :trains, :sort_direct, :boolean, default: false, null: false
  end
end
