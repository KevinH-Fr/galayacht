class Contrat < ApplicationRecord
    belongs_to :reservation, optional: true
end
