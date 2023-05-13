class Bailleur < ApplicationRecord
    has_many :produits

    has_one_attached :profilepic
end
