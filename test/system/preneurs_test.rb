require "application_system_test_case"

class PreneursTest < ApplicationSystemTestCase
  setup do
    @preneur = preneurs(:one)
  end

  test "visiting the index" do
    visit preneurs_url
    assert_selector "h1", text: "Preneurs"
  end

  test "should create preneur" do
    visit preneurs_url
    click_on "New preneur"

    fill_in "Mail", with: @preneur.mail
    fill_in "Nom", with: @preneur.nom
    fill_in "Prenom", with: @preneur.prenom
    fill_in "Telephone", with: @preneur.telephone
    click_on "Create Preneur"

    assert_text "Preneur was successfully created"
    click_on "Back"
  end

  test "should update Preneur" do
    visit preneur_url(@preneur)
    click_on "Edit this preneur", match: :first

    fill_in "Mail", with: @preneur.mail
    fill_in "Nom", with: @preneur.nom
    fill_in "Prenom", with: @preneur.prenom
    fill_in "Telephone", with: @preneur.telephone
    click_on "Update Preneur"

    assert_text "Preneur was successfully updated"
    click_on "Back"
  end

  test "should destroy Preneur" do
    visit preneur_url(@preneur)
    click_on "Destroy this preneur", match: :first

    assert_text "Preneur was successfully destroyed"
  end
end
