class Carriage < ApplicationRecord
  belongs_to :train, optional: true

  # validates :kind, presence: true 
  validates :train_id, presence: true 
  validates :number, uniqueness: { scope: :train_id }

  before_validation :set_number

  scope :compart, -> { where(type: 'CompartCarriage') }
  scope :economy, -> { where(type: 'EconomyCarriage') }
  scope :seats, -> { where(type: 'SeatsCarriage') }
  scope :sv, -> { where(type: 'SvCarriage') }

  scope :sort_up, -> { order(number: :asc) }
  scope :sort_down, -> { order(number: :desc) }
  
  private
  def set_number
    numbers ||= []
    n = self.train_id
    train.carriages.each{ |carriage| numbers << carriage.number } 
    i = 1
    loop do
      if numbers.include?(i)
        i+=1
      else
        self.number ||= i
        break
      end
    end
  end

end