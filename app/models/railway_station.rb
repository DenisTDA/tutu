class RailwayStation < ApplicationRecord
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes
  has_many :tickets inverse_of: 'start_station'
  has_many :tickets inverse_of: 'end_station'
  has_many :trains
end
