class Carriage < ApplicationRecord
  belongs_to :train, optional: true

  validates :train_id, presence: true 
  validates :number, uniqueness: {scope: :train_id}

  before_validation :set_number

  scope :sv, -> { where(type: 'SvCarriage') }
  scope :cupe, -> { where(type: 'CupeCarriage') }
  scope :seats, -> { where(type: 'SeatsCarriage') }
  scope :economy, -> { where(type: 'EconomyCarriage') }

  private
  def set_number
    numbers = []
    train.carriages.each{ |car| numbers << car.number}
    i = 1
    loop do
      unless numbers.include?(i)
        self.number = i
        break
      else
        i+=1
      end
    end
  end

end