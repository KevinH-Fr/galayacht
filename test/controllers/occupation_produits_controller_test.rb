require "test_helper"

class OccupationProduitsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @occupation_produit = occupation_produits(:one)
  end

  test "should get index" do
    get occupation_produits_url
    assert_response :success
  end

  test "should get new" do
    get new_occupation_produit_url
    assert_response :success
  end

  test "should create occupation_produit" do
    assert_difference("OccupationProduit.count") do
      post occupation_produits_url, params: { occupation_produit: { debut: @occupation_produit.debut, fin: @occupation_produit.fin, produit_id: @occupation_produit.produit_id } }
    end

    assert_redirected_to occupation_produit_url(OccupationProduit.last)
  end

  test "should show occupation_produit" do
    get occupation_produit_url(@occupation_produit)
    assert_response :success
  end

  test "should get edit" do
    get edit_occupation_produit_url(@occupation_produit)
    assert_response :success
  end

  test "should update occupation_produit" do
    patch occupation_produit_url(@occupation_produit), params: { occupation_produit: { debut: @occupation_produit.debut, fin: @occupation_produit.fin, produit_id: @occupation_produit.produit_id } }
    assert_redirected_to occupation_produit_url(@occupation_produit)
  end

  test "should destroy occupation_produit" do
    assert_difference("OccupationProduit.count", -1) do
      delete occupation_produit_url(@occupation_produit)
    end

    assert_redirected_to occupation_produits_url
  end
end
