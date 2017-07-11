class Ticket < ApplicationRecord
  belongs_to :start_station, class_name: 'RailwayStation', foreign_key: :start_station_id
  belongs_to :end_station, class_name: 'RailwayStation', foreign_key: :end_station_id
  belongs_to :train
  belongs_to :user

  after_create :send_notification
  after_destroy :send_notification_refuse

  validates :number, uniqueness: true 

  before_validation :set_number, if: :need_set_number? 

  def route_name
    "#{start_station.title} - #{end_station.title}"
  end

  def send_notification
    TicketsMailer.buy_ticket(self.user, self).deliver_now
  end

  def send_notification_refuse
    TicketsMailer.refuse_ticket(self.user, self).deliver_now
  end
  
  private
  def need_set_number?
    number.blank? || Ticket.where(number: number).count > 1 
  end

  def set_number
    self.number = "Ekb-66-01-#{Ticket.maximum(:id).to_i + 1}"
  end
end
