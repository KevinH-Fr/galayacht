json.extract! reservation, :id, :produit_id, :preneur_id, :debutlocation, :finlocation, :prix, :statut, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
