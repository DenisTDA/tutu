class DeleteKindFromCarriages < ActiveRecord::Migration[5.1]
  def change
    remove_column :carriages, :kind, :string
  end
end
