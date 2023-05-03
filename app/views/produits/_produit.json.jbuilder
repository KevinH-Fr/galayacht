json.extract! produit, :id, :nom, :type, :longueur, :largeur, :marque, :model, :prixjour, :prixsemaine, :bailleur_id, :created_at, :updated_at
json.url produit_url(produit, format: :json)
