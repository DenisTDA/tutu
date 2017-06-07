class Carriage < ApplicationRecord
  belongs_to :train, optional: true

  validates :number, uniqueness: { scope: :train_id }

  before_validation :set_number, if: :need_set_number?

  scope :sv, -> { where(type: 'SvCarriage') }
  scope :cupe, -> { where(type: 'CupeCarriage') }
  scope :seats, -> { where(type: 'SeatsCarriage') }
  scope :economy, -> { where(type: 'EconomyCarriage') }

  private
  def need_set_number?
    number.nil? || train_id_changed?
  end
  
  def set_number
    numbers = train.carriages.pluck(:number)
    i = 1
    i += 1 while numbers.include?(i)
    self.number = i
  end
end
