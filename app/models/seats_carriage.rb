class SeatsCarriage < Carriage
  validates :seats_place, presence: true 
  validates :bottom_place, :top_place, :side_bottom_place, 
            :side_top_place, presence: false 
end