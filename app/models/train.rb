class Train < ApplicationRecord
  belongs_to :route, optional: true
  belongs_to :current_station, class_name: 'RailwayStation', 
    foreign_key: :current_station_id, optional: true
  has_many :tickets
  has_many :carriages

  validates :number, presence: true

  scope :station_in_route, ->(station) { joins(route: :railway_stations).
                                      where(railway_stations: {id: station}) }

  def self.search(start_station, end_station)
    Train.station_in_route(start_station) & Train.station_in_route(end_station)
  end

  def order_car
    sort_direct ? carriages.order(number: :asc) : carriages.order(number: :desc)
  end

  def count_places(car_type, place_type)
    carriages.where(type: car_type).sum(place_type)
  end

  def check_current_station
    self.current_station ||= self.route.railway_stations.first
    self.save
  end

end
