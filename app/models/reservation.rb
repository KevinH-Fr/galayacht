class Reservation < ApplicationRecord
  belongs_to :produit
  belongs_to :preneur

  validates :preneur_id, presence: true
  validates :debutlocation, presence: true
  validates :finlocation, presence: true

  def full_name
    "#{self.id} #{self.produit.nom} #{self.preneur.nom}"
  end

end
