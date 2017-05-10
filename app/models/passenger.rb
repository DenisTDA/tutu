class Passenger < ApplicationRecord
  has_many :tickets

  validates :name, presence: true 
  validates :lastname, presence: true 
end