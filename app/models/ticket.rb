class Ticket < ApplicationRecord
  belongs_to :start_station, class_name: 'RailwayStation', foreign_key: :start_station_id
  belongs_to :end_station, class_name: 'RailwayStation', foreign_key: :end_station_id
  belongs_to :train
  belongs_to :user

  validates :number, uniqueness: true 

  before_validation :set_number, if: :need_set_number? 

  private
  def need_set_number?
    number.blank? || Ticket.where(number: number).count > 1 
  end

  def set_number
    self.number = "Ekb-66-01-#{Ticket.maximum(:id).to_i + 1}"
  end
end
