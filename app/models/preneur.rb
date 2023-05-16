class Preneur < ApplicationRecord
    has_one_attached :profilepic

    belongs_to :user

end
