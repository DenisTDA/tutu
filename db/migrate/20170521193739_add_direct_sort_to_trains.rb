class AddDirectSortToTrains < ActiveRecord::Migration[5.1]
  def change
    add_column :trains, :direct_sort, :boolean
  end
end
