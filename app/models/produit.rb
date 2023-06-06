class Produit < ApplicationRecord
  belongs_to :bailleur
  belongs_to :destination
  
  has_one_attached :image1
  has_one_attached :image2
  has_one_attached :image3

  validate :validate_image_format
  validate :validate_image_size

  #has_many :occupations

  has_many :schedules
  has_many :reservations
  #accepts_nested_attributes_for :occupations

 # validates :destination_id, presence: true

  #validates :country, presence: true

  #validates :state, inclusion: { in: -> (record) { record.states.keys }, allow_blank: true }
  #validates :state, presence: { if: -> (record) { record.states.present? }}

  #validates :city, inclusion: { in: -> (record) { record.cities }, allow_blank: true }
  #validates :city, presence: { if: -> (record) { record.cities.present? }}

 # def countries
 #   CS.countries.with_indifferent_access
 # end

#  def states
#    CS.states(country).with_indifferent_access
#  end
 
#  def cities
#    CS.cities(state, country) || []
#  end

#  def country_label
#    countries[country]
#  end

#  def state_label
#    states[state]
#  end

  def self.ransackable_attributes(auth_object = nil)
    ["bailleur_id", "city", "country", "created_at", "id", "largeur", "longueur", "marque", "model", 
      "nom", "prixjour", "prixsemaine", "state", "type_produit", "updated_at", "destination_id"]
  end

  def self.ransackable_associations(*)
    []
  end

  private

  def validate_image_format
    supported_formats = ['image/jpeg', 'image/png']
    images = [image1, image2, image3]

    images.each_with_index do |image, index|
      if image.attached? && !image.content_type.in?(supported_formats)
        errors.add(:"image#{index + 1}", "must be a JPG or PNG file.")
      end
    end
  end


  def validate_image_size
    max_size_in_bytes = 5.megabytes
    images = [image1, image2, image3]
  
    images.each_with_index do |image, index|
      if image.attached? && image.blob.byte_size > max_size_in_bytes
        errors.add(:"image#{index + 1}", "is too big. Please upload an image smaller than 5MB.")
      end
    end
  end
  

end 