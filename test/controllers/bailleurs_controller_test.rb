require "test_helper"

class BailleursControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bailleur = bailleurs(:one)
  end

  test "should get index" do
    get bailleurs_url
    assert_response :success
  end

  test "should get new" do
    get new_bailleur_url
    assert_response :success
  end

  test "should create bailleur" do
    assert_difference("Bailleur.count") do
      post bailleurs_url, params: { bailleur: { mail: @bailleur.mail, nom: @bailleur.nom, prenom: @bailleur.prenom, telephone: @bailleur.telephone } }
    end

    assert_redirected_to bailleur_url(Bailleur.last)
  end

  test "should show bailleur" do
    get bailleur_url(@bailleur)
    assert_response :success
  end

  test "should get edit" do
    get edit_bailleur_url(@bailleur)
    assert_response :success
  end

  test "should update bailleur" do
    patch bailleur_url(@bailleur), params: { bailleur: { mail: @bailleur.mail, nom: @bailleur.nom, prenom: @bailleur.prenom, telephone: @bailleur.telephone } }
    assert_redirected_to bailleur_url(@bailleur)
  end

  test "should destroy bailleur" do
    assert_difference("Bailleur.count", -1) do
      delete bailleur_url(@bailleur)
    end

    assert_redirected_to bailleurs_url
  end
end
