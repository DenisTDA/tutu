class RailwayStationsRoute < ApplicationRecord
  belongs_to :railway_station
  belongs_to :route

  validates :railway_station_id, uniqueness: { scope: :route_id}
  validates :number_order, uniqueness: { scope: :route_id}

scope :order_stations, -> { order(:number_order) }

end