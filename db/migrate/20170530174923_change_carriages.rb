class ChangeCarriages < ActiveRecord::Migration[5.1]
  def change
    change_table :carriages do |t|
      t.remove :kind
      t.string :type
      t.integer :top_place, :botoom_place, :side_top_place, 
                :side_bottom_place, :seats_place, :number
    end

    add_column(:carriages, :created_at, :datetime)
    add_column(:carriages, :updated_at, :datetime)
  end
end
