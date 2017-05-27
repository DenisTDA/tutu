class Route < ApplicationRecord
  has_many :trains 
  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes

  validates :name, presence: true
  validate :stations_count

  before_validation :set_name

  def ordering
    i = 1
    self.railway_stations_routes.each do |line| 
      line.update_attribute(:number_order, i)
      i+=1
    end
  end

  private
  def set_name
    self.name ||= "#{railway_stations.first.title} - #{railway_stations.last.title}"     
  end 

  def stations_count
    if railway_stations.size < 2
      errors.add(:base, 'Route should contain at least 2 stations!')
    end    
  end
end
