class CreateContrats < ActiveRecord::Migration[7.0]
  def change
    create_table :contrats do |t|
      t.boolean :model_contrat
      t.string :loc_nom
      t.string :loc_adresse
      t.string :loc_telephone
      t.string :loc_mail
      t.string :bateau_ref
      t.string :bateau_proprietaire_nom
      t.string :bateau_marque
      t.string :bateau_model
      t.string :armement
      t.string :moteur
      t.string :carbutant
      t.integer :nb_equipage
      t.datetime :debut_loc
      t.datetime :fin_loc
      t.string :lieu
      t.integer :prix_ht
      t.integer :tva
      t.integer :acompte
      t.integer :caution
      t.integer :franchise
      t.string :lieu_sign
      t.date :date_sign
      t.boolean :capitaine
      t.string :capitaine_nom
      t.string :capitaine_tel
      t.string :capitaine_mail
      t.string :type_duree
      t.date :capitaine_debut
      t.date :capitaine_fin
      t.boolean :capitaine_renew
      t.string :capitaine_fonctions
      t.boolean :capitaine_periode_essai
      t.integer :capitaine_salaire
      t.integer :capitaine_duree_travail
      t.boolean :capitaine_nourriture
      t.string :capitaine_indemnite_nourritaire_jour
      t.integer :capitaine_conges_payes
      t.integer :capitaine_preavis

      t.timestamps
    end
  end
end
