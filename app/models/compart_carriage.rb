class CompartCarriage < Carriage
  validates :top, :bottom, presence: true 
end