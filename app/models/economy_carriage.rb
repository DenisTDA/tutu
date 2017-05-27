class EconomyCarriage < Carriage
  validates :top, :bottom, :side_top, :side_bottom ,presence: true 
end