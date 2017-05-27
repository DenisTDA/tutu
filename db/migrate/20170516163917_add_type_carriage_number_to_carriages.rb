class AddTypeCarriageNumberToCarriages < ActiveRecord::Migration[5.1]
  def change
    add_column :carriages, :side_top, :integer
    add_column :carriages, :side_bottom, :integer
    add_column :carriages, :seats_place, :integer
    add_column :carriages, :type, :string
    add_column :carriages, :number, :integer
    
    add_column(:carriages, :created_at, :datetime)
    add_column(:carriages, :updated_at, :datetime)    
  end
end
