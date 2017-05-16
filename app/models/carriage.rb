class Carriage < ApplicationRecord
  belongs_to :train, optional: true

  # validates :kind, presence: true 
  validates :train_id, presence: true 
  validates :number, uniqueness: { scope: :train_id }

  after_validation :set_number
  

  private
  
  def set_number
    carriages = Train.find(:train_id).carriages
    carriages.each{ |carriage| numbers << carriage.number } 
    i = 1
    loop do
      unless numbers.include?(i)
        i+=1
      else
        self.number = i
        break
      end
    end
  end

end