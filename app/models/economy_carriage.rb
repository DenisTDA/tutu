class EconomyCarriage < Carriage
  validates :bottom_place, :top_place, :side_bottom_place, 
            :side_top_place, presence: true 
end