class RailwayStationsRoute < ApplicationRecord
  belongs_to :railway_station, optional: true
  belongs_to :route, optional: true

  validates :railway_station_id, uniqueness: { scope: :route_id}
  validates :number_order, uniqueness: { scope: :route_id}

end