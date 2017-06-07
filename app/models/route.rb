class Route < ApplicationRecord
  has_many :trains
  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes

  validates :name, presence: true
  validate :station_count

  before_validation :set_name

  private

  def station_count
    if railway_stations.size < 2
      errors.add(:base, 'Route should contain at least 2 stations!')
    end
  end

  def set_name
    self.name = "#{railway_stations.first.title} - #{railway_stations.last.title}"
  end
end
