json.extract! demande, :id, :nom, :mail, :telephone, :type_demande, :commentaires, :created_at, :updated_at
json.url demande_url(demande, format: :json)
