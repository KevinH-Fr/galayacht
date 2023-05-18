require "application_system_test_case"

class OccupationProduitsTest < ApplicationSystemTestCase
  setup do
    @occupation_produit = occupation_produits(:one)
  end

  test "visiting the index" do
    visit occupation_produits_url
    assert_selector "h1", text: "Occupation produits"
  end

  test "should create occupation produit" do
    visit occupation_produits_url
    click_on "New occupation produit"

    fill_in "Debut", with: @occupation_produit.debut
    fill_in "Fin", with: @occupation_produit.fin
    fill_in "Produit", with: @occupation_produit.produit_id
    click_on "Create Occupation produit"

    assert_text "Occupation produit was successfully created"
    click_on "Back"
  end

  test "should update Occupation produit" do
    visit occupation_produit_url(@occupation_produit)
    click_on "Edit this occupation produit", match: :first

    fill_in "Debut", with: @occupation_produit.debut
    fill_in "Fin", with: @occupation_produit.fin
    fill_in "Produit", with: @occupation_produit.produit_id
    click_on "Update Occupation produit"

    assert_text "Occupation produit was successfully updated"
    click_on "Back"
  end

  test "should destroy Occupation produit" do
    visit occupation_produit_url(@occupation_produit)
    click_on "Destroy this occupation produit", match: :first

    assert_text "Occupation produit was successfully destroyed"
  end
end
