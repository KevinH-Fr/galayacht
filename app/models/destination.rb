class Destination < ApplicationRecord
    has_one_attached :image1

    has_many :produits

    def full_name
        "#{ville} #{port}"
    end
end
