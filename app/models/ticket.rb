class Ticket < ApplicationRecord
  belongs_to :start_station, class_name: 'RailwayStation', foreign_key: :start_station_id
  belongs_to :end_station, class_name: 'RailwayStation', foreign_key: :end_station_id
  belongs_to :train
  belongs_to :user

  validates :number, uniqueness: true 

  before_validation :set_number, if: :need_set_number? 

  private
  def need_set_number?
    number.nil? || Ticket.pluck(:number).count(number) > 1 || number == ''
  end

  def set_number
    Ticket.last ? self.number = "Ekb-66-01-#{Ticket.last.id + 1}" : self.number = '1'
  end
end
