class Ticket < ApplicationRecord
  belongs_to :start_station, class_name: 'RailwayStation', foreign_key: :start_station_id
  belongs_to :end_station, class_name: 'RailwayStation', foreign_key: :end_station_id
  belongs_to :train
  belongs_to :user

  validates :number, uniqueness: true 

  before_validation :set_number

  private
  def set_number
    Ticket.last ? self.number = "Ekb-66-00-#{Ticket.last.id + 1}" : self.number = '1'
  end
end
