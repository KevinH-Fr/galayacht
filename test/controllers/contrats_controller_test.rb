require "test_helper"

class ContratsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contrat = contrats(:one)
  end

  test "should get index" do
    get contrats_url
    assert_response :success
  end

  test "should get new" do
    get new_contrat_url
    assert_response :success
  end

  test "should create contrat" do
    assert_difference("Contrat.count") do
      post contrats_url, params: { contrat: { acompte: @contrat.acompte, armement: @contrat.armement, bateau_marque: @contrat.bateau_marque, bateau_model: @contrat.bateau_model, bateau_proprietaire_nom: @contrat.bateau_proprietaire_nom, bateau_ref: @contrat.bateau_ref, capitaine: @contrat.capitaine, capitaine_conges_payes: @contrat.capitaine_conges_payes, capitaine_debut: @contrat.capitaine_debut, capitaine_duree_travail: @contrat.capitaine_duree_travail, capitaine_fin: @contrat.capitaine_fin, capitaine_fonctions: @contrat.capitaine_fonctions, capitaine_indemnite_nourritaire_jour: @contrat.capitaine_indemnite_nourritaire_jour, capitaine_mail: @contrat.capitaine_mail, capitaine_nom: @contrat.capitaine_nom, capitaine_nourriture: @contrat.capitaine_nourriture, capitaine_periode_essai: @contrat.capitaine_periode_essai, capitaine_preavis: @contrat.capitaine_preavis, capitaine_renew: @contrat.capitaine_renew, capitaine_salaire: @contrat.capitaine_salaire, capitaine_tel: @contrat.capitaine_tel, carbutant: @contrat.carbutant, caution: @contrat.caution, date_sign: @contrat.date_sign, debut_loc: @contrat.debut_loc, fin_loc: @contrat.fin_loc, franchise: @contrat.franchise, lieu: @contrat.lieu, lieu_sign: @contrat.lieu_sign, loc_adresse: @contrat.loc_adresse, loc_mail: @contrat.loc_mail, loc_nom: @contrat.loc_nom, loc_telephone: @contrat.loc_telephone, model_contrat: @contrat.model_contrat, moteur: @contrat.moteur, nb_equipage: @contrat.nb_equipage, prix_ht: @contrat.prix_ht, tva: @contrat.tva, type_duree: @contrat.type_duree } }
    end

    assert_redirected_to contrat_url(Contrat.last)
  end

  test "should show contrat" do
    get contrat_url(@contrat)
    assert_response :success
  end

  test "should get edit" do
    get edit_contrat_url(@contrat)
    assert_response :success
  end

  test "should update contrat" do
    patch contrat_url(@contrat), params: { contrat: { acompte: @contrat.acompte, armement: @contrat.armement, bateau_marque: @contrat.bateau_marque, bateau_model: @contrat.bateau_model, bateau_proprietaire_nom: @contrat.bateau_proprietaire_nom, bateau_ref: @contrat.bateau_ref, capitaine: @contrat.capitaine, capitaine_conges_payes: @contrat.capitaine_conges_payes, capitaine_debut: @contrat.capitaine_debut, capitaine_duree_travail: @contrat.capitaine_duree_travail, capitaine_fin: @contrat.capitaine_fin, capitaine_fonctions: @contrat.capitaine_fonctions, capitaine_indemnite_nourritaire_jour: @contrat.capitaine_indemnite_nourritaire_jour, capitaine_mail: @contrat.capitaine_mail, capitaine_nom: @contrat.capitaine_nom, capitaine_nourriture: @contrat.capitaine_nourriture, capitaine_periode_essai: @contrat.capitaine_periode_essai, capitaine_preavis: @contrat.capitaine_preavis, capitaine_renew: @contrat.capitaine_renew, capitaine_salaire: @contrat.capitaine_salaire, capitaine_tel: @contrat.capitaine_tel, carbutant: @contrat.carbutant, caution: @contrat.caution, date_sign: @contrat.date_sign, debut_loc: @contrat.debut_loc, fin_loc: @contrat.fin_loc, franchise: @contrat.franchise, lieu: @contrat.lieu, lieu_sign: @contrat.lieu_sign, loc_adresse: @contrat.loc_adresse, loc_mail: @contrat.loc_mail, loc_nom: @contrat.loc_nom, loc_telephone: @contrat.loc_telephone, model_contrat: @contrat.model_contrat, moteur: @contrat.moteur, nb_equipage: @contrat.nb_equipage, prix_ht: @contrat.prix_ht, tva: @contrat.tva, type_duree: @contrat.type_duree } }
    assert_redirected_to contrat_url(@contrat)
  end

  test "should destroy contrat" do
    assert_difference("Contrat.count", -1) do
      delete contrat_url(@contrat)
    end

    assert_redirected_to contrats_url
  end
end
