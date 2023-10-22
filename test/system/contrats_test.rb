require "application_system_test_case"

class ContratsTest < ApplicationSystemTestCase
  setup do
    @contrat = contrats(:one)
  end

  test "visiting the index" do
    visit contrats_url
    assert_selector "h1", text: "Contrats"
  end

  test "should create contrat" do
    visit contrats_url
    click_on "New contrat"

    fill_in "Acompte", with: @contrat.acompte
    fill_in "Armement", with: @contrat.armement
    fill_in "Bateau marque", with: @contrat.bateau_marque
    fill_in "Bateau model", with: @contrat.bateau_model
    fill_in "Bateau proprietaire nom", with: @contrat.bateau_proprietaire_nom
    fill_in "Bateau ref", with: @contrat.bateau_ref
    check "Capitaine" if @contrat.capitaine
    fill_in "Capitaine conges payes", with: @contrat.capitaine_conges_payes
    fill_in "Capitaine debut", with: @contrat.capitaine_debut
    fill_in "Capitaine duree travail", with: @contrat.capitaine_duree_travail
    fill_in "Capitaine fin", with: @contrat.capitaine_fin
    fill_in "Capitaine fonctions", with: @contrat.capitaine_fonctions
    fill_in "Capitaine indemnite nourritaire jour", with: @contrat.capitaine_indemnite_nourritaire_jour
    fill_in "Capitaine mail", with: @contrat.capitaine_mail
    fill_in "Capitaine nom", with: @contrat.capitaine_nom
    check "Capitaine nourriture" if @contrat.capitaine_nourriture
    check "Capitaine periode essai" if @contrat.capitaine_periode_essai
    fill_in "Capitaine preavis", with: @contrat.capitaine_preavis
    check "Capitaine renew" if @contrat.capitaine_renew
    fill_in "Capitaine salaire", with: @contrat.capitaine_salaire
    fill_in "Capitaine tel", with: @contrat.capitaine_tel
    fill_in "Carbutant", with: @contrat.carbutant
    fill_in "Caution", with: @contrat.caution
    fill_in "Date sign", with: @contrat.date_sign
    fill_in "Debut loc", with: @contrat.debut_loc
    fill_in "Fin loc", with: @contrat.fin_loc
    fill_in "Franchise", with: @contrat.franchise
    fill_in "Lieu", with: @contrat.lieu
    fill_in "Lieu sign", with: @contrat.lieu_sign
    fill_in "Loc adresse", with: @contrat.loc_adresse
    fill_in "Loc mail", with: @contrat.loc_mail
    fill_in "Loc nom", with: @contrat.loc_nom
    fill_in "Loc telephone", with: @contrat.loc_telephone
    check "Model contrat" if @contrat.model_contrat
    fill_in "Moteur", with: @contrat.moteur
    fill_in "Nb equipage", with: @contrat.nb_equipage
    fill_in "Prix ht", with: @contrat.prix_ht
    fill_in "Tva", with: @contrat.tva
    fill_in "Type duree", with: @contrat.type_duree
    click_on "Create Contrat"

    assert_text "Contrat was successfully created"
    click_on "Back"
  end

  test "should update Contrat" do
    visit contrat_url(@contrat)
    click_on "Edit this contrat", match: :first

    fill_in "Acompte", with: @contrat.acompte
    fill_in "Armement", with: @contrat.armement
    fill_in "Bateau marque", with: @contrat.bateau_marque
    fill_in "Bateau model", with: @contrat.bateau_model
    fill_in "Bateau proprietaire nom", with: @contrat.bateau_proprietaire_nom
    fill_in "Bateau ref", with: @contrat.bateau_ref
    check "Capitaine" if @contrat.capitaine
    fill_in "Capitaine conges payes", with: @contrat.capitaine_conges_payes
    fill_in "Capitaine debut", with: @contrat.capitaine_debut
    fill_in "Capitaine duree travail", with: @contrat.capitaine_duree_travail
    fill_in "Capitaine fin", with: @contrat.capitaine_fin
    fill_in "Capitaine fonctions", with: @contrat.capitaine_fonctions
    fill_in "Capitaine indemnite nourritaire jour", with: @contrat.capitaine_indemnite_nourritaire_jour
    fill_in "Capitaine mail", with: @contrat.capitaine_mail
    fill_in "Capitaine nom", with: @contrat.capitaine_nom
    check "Capitaine nourriture" if @contrat.capitaine_nourriture
    check "Capitaine periode essai" if @contrat.capitaine_periode_essai
    fill_in "Capitaine preavis", with: @contrat.capitaine_preavis
    check "Capitaine renew" if @contrat.capitaine_renew
    fill_in "Capitaine salaire", with: @contrat.capitaine_salaire
    fill_in "Capitaine tel", with: @contrat.capitaine_tel
    fill_in "Carbutant", with: @contrat.carbutant
    fill_in "Caution", with: @contrat.caution
    fill_in "Date sign", with: @contrat.date_sign
    fill_in "Debut loc", with: @contrat.debut_loc
    fill_in "Fin loc", with: @contrat.fin_loc
    fill_in "Franchise", with: @contrat.franchise
    fill_in "Lieu", with: @contrat.lieu
    fill_in "Lieu sign", with: @contrat.lieu_sign
    fill_in "Loc adresse", with: @contrat.loc_adresse
    fill_in "Loc mail", with: @contrat.loc_mail
    fill_in "Loc nom", with: @contrat.loc_nom
    fill_in "Loc telephone", with: @contrat.loc_telephone
    check "Model contrat" if @contrat.model_contrat
    fill_in "Moteur", with: @contrat.moteur
    fill_in "Nb equipage", with: @contrat.nb_equipage
    fill_in "Prix ht", with: @contrat.prix_ht
    fill_in "Tva", with: @contrat.tva
    fill_in "Type duree", with: @contrat.type_duree
    click_on "Update Contrat"

    assert_text "Contrat was successfully updated"
    click_on "Back"
  end

  test "should destroy Contrat" do
    visit contrat_url(@contrat)
    click_on "Destroy this contrat", match: :first

    assert_text "Contrat was successfully destroyed"
  end
end
