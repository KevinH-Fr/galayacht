class Reservation < ApplicationRecord
  belongs_to :produit
  belongs_to :preneur
end
