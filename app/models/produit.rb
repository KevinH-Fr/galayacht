class Produit < ApplicationRecord
  belongs_to :bailleur

  has_one_attached :image1

end
