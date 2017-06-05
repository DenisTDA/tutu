class RailwayStation < ApplicationRecord
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes
  has_many :start_station_tickets, class_name: 'Ticket', foreign_key: :start_station_id
  has_many :end_station_tickets, class_name: 'Ticket', foreign_key: :end_station_id
  has_many :trains

  validates :title, presence: true

  scope :order_stations, -> { joins(:railway_stations_routes).    
                            order('railway_stations_routes.number_order').uniq }

  def update_position(route, position)
    station_route = station_route(route)
    station_route.update(number_order: position) if station_route
  end

  def position_in(route)
    station_route(route).try(:number_order)
  end

  def time_event(route, time)
    station_route(route).try(time).strftime("%H:%M")
  end

  protected
  def station_route(route)
    @station_route ||= railway_stations_routes.where(route: route).first
  end

end
