class Carriage < ApplicationRecord
  belongs_to :train, optional: true

  validates :kind, presence: true 
  validates :train_id, presence: true 
end