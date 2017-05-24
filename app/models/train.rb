class Train < ApplicationRecord
  belongs_to :route, optional: true
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id, optional: true
  has_many :tickets
  has_many :carriages

  validates :number, presence: true 

  def count_seats(car_type, seats_type)
    carriages.where(type: car_type).sum(seats_type)
  end

  def sort_carriages
    direct_sort ? carriages.sort_up : carriages.sort_down
  end
end
