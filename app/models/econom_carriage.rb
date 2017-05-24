class EconomyCarriage < Carriage
  validates :top, :bottom, :side_tope, :side_bottom ,presence: true 
end