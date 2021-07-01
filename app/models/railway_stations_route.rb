class RailwayStationsRoute < ApplicationRecord
  belongs_to :railway_station
  belongs_to :route

  # validates :number_order, uniqueness: { scope: :route_id }
end
