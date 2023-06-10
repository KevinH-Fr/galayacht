class Produit < ApplicationRecord
  belongs_to :bailleur
  belongs_to :destination
  
  has_one_attached :image1
  has_one_attached :image2
  has_one_attached :image3

  validates :nom, presence: true

  validate :validate_image_format
  validate :validate_image_size

  #has_many :occupations

  has_many :schedules
  has_many :reservations

  enum bateau_type: [:moteur, :voilier]



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