class Produit < ApplicationRecord
  belongs_to :bailleur
  belongs_to :destination
  
  has_one_attached :image1

  validates :country, presence: true

  validates :state, inclusion: { in: -> (record) { record.states.keys }, allow_blank: true }
  validates :state, presence: { if: -> (record) { record.states.present? }}

  validates :city, inclusion: { in: -> (record) { record.cities }, allow_blank: true }
  validates :city, presence: { if: -> (record) { record.cities.present? }}

  def countries
    CS.countries.with_indifferent_access
  end

  
  def states
    CS.states(country).with_indifferent_access
  end

  
  def cities
    CS.cities(state, country) || []
  end

  def country_label
    countries[country]
  end

  def state_label
    states[state]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["bailleur_id", "city", "country", "created_at", "id", "largeur", "longueur", "marque", "model", "nom", "prixjour", "prixsemaine", "state", "type_produit", "updated_at"]
  end

  def self.ransackable_associations(*)
    []
  end

end 