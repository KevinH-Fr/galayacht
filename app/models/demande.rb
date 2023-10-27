class Demande < ApplicationRecord

   validates :nom, presence: true

   validates :telephone, presence: true, if: -> { mail.blank? }
   validates :mail, presence: true, if: -> { telephone.blank? }
   
   
   def full_name
      "#{nom} #{type_demande} #{commentaires}"
   end

end
