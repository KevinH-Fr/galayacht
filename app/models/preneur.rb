class Preneur < ApplicationRecord
    has_one_attached :profilepic

    belongs_to :user

    validates :nom, presence: true
    validates :telephone, presence: true, if: -> { mail.blank? }
    validates :mail, presence: true, if: -> { telephone.blank? }

    def full_name
        "#{prenom} #{nom}"
    end

end
