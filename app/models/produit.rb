class Produit < ApplicationRecord
  belongs_to :bailleur
  belongs_to :destination
  
  has_one_attached :image1
  has_many_attached :medias

  validates :nom, presence: true
  validates :model, presence: true


  validates :prixjour, presence: true
  validates :prixsemaine, presence: true
  validates :prixjour_hautesaison, presence: true
  validates :prixsemaine_hautesaison, presence: true


  validate :medias_format_and_size

  #has_many :occupations

  has_many :schedules
  has_many :reservations

  enum bateau_type: [:moteur, :voilier]

  scope :actif, -> { where(archive: [false, nil]) }
  scope :archive, -> { where(archive: true) }

  scope :vente, -> {where(vente: true)}
  scope :location, -> {where(location: true)}

  def self.ransackable_attributes(auth_object = nil)
    ["bailleur_id", "city", "country", "created_at", "id", "largeur", "longueur", "marque", "model", 
      "nom", "prixjour", "prixsemaine", "state", "type_produit", "updated_at", "destination_id"]
  end

  def self.ransackable_associations(*)
    []
  end

  private

  def medias_format_and_size
    # Check "image1" attachment
    if image1.attached?
      unless image1.blob.content_type.in?(%w(image/jpeg image/png image/gif))
        errors.add(:image1, 'must be a JPEG, PNG, or GIF image')
      end
  
      unless image1.blob.byte_size <= 5.megabytes
        errors.add(:image1, 'size should be less than 5MB')
      end
    end
  
    # Check "medias" attachments
    medias.each do |media|
      if media.present?
        unless media.content_type.in?(%w(image/jpeg image/png image/gif video/mp4 video/quicktime))
          errors.add(:medias, 'must be an image (JPEG, PNG, GIF) or video (MP4, QuickTime)')
        end
  
        unless media.byte_size <= 50.megabytes
          errors.add(:medias, 'size should be less than 50MB')
        end
      end
    end
  end
  
end 