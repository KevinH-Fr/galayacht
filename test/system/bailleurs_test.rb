require "application_system_test_case"

class BailleursTest < ApplicationSystemTestCase
  setup do
    @bailleur = bailleurs(:one)
  end

  test "visiting the index" do
    visit bailleurs_url
    assert_selector "h1", text: "Bailleurs"
  end

  test "should create bailleur" do
    visit bailleurs_url
    click_on "New bailleur"

    fill_in "Mail", with: @bailleur.mail
    fill_in "Nom", with: @bailleur.nom
    fill_in "Prenom", with: @bailleur.prenom
    fill_in "Telephone", with: @bailleur.telephone
    click_on "Create Bailleur"

    assert_text "Bailleur was successfully created"
    click_on "Back"
  end

  test "should update Bailleur" do
    visit bailleur_url(@bailleur)
    click_on "Edit this bailleur", match: :first

    fill_in "Mail", with: @bailleur.mail
    fill_in "Nom", with: @bailleur.nom
    fill_in "Prenom", with: @bailleur.prenom
    fill_in "Telephone", with: @bailleur.telephone
    click_on "Update Bailleur"

    assert_text "Bailleur was successfully updated"
    click_on "Back"
  end

  test "should destroy Bailleur" do
    visit bailleur_url(@bailleur)
    click_on "Destroy this bailleur", match: :first

    assert_text "Bailleur was successfully destroyed"
  end
end
