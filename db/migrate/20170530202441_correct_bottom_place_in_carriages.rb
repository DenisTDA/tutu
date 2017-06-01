class CorrectBottomPlaceInCarriages < ActiveRecord::Migration[5.1]
  def change
    rename_column :carriages, :botoom_place, :bottom_place
  end
end
