class Train < ApplicationRecord
  belongs_to :route, optional: true
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id, optional: true
  has_many :tickets
  has_many :carriages

  validates :number, presence: true 

  def order_car
    self.sort_direct ? carriages.order(number: :asc) : carriages.order(number: :desc)
  end

  def count_places(car_type, place_type)
    carriages.where(type: car_type).sum(place_type)
  end
end
