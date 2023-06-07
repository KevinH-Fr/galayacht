class Bailleur < ApplicationRecord
    has_many :produits

    belongs_to :user

    has_one_attached :profilepic

    validates :nom, presence: true
    validates :telephone, presence: true, if: -> { mail.blank? }
    validates :mail, presence: true, if: -> { telephone.blank? }


end
