class AddStationsTrainPassengerToTickets < ActiveRecord::Migration[5.1]
  def change
    add_belongs_to :tickets, :passenger
    add_belongs_to :tickets, :train
    add_belongs_to :tickets, :start_station
    add_belongs_to :tickets, :end_station
  end
end
