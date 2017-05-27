class RailwayStation < ApplicationRecord
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes
  has_many :start_station_tickets, class_name: 'Ticket', foreign_key: :start_station_id
  has_many :end_station_tickets, class_name: 'Ticket', foreign_key: :end_station_id
  has_many :trains

  validates :title, presence: true 
   scope :order_stations, -> { select('railway_stations.*, railway_stations_routes.number_order').joins(:railway_stations_routes).order('railway_stations_routes.number_order').uniq }

  def update_position(route, position)
    rsr = railway_stations_routes.where(route: route)
    rsr.each do | line | 
      if line.railway_station_id == self.id 
        line.number_order = position 
        line.save
      end
    end
  end
  
  def position(route)
    rsr = railway_stations_routes.where(route: route)
    rsr.each {| line | @position = line.number_order if line.railway_station_id == self.id }
    @position
    # station_route(route).try(:position)
  end
end
