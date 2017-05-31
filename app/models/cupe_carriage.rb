class CupeCarriage < Carriage
  validates :bottom_place, :top_place, presence: true 
end