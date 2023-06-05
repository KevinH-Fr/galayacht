require "test_helper"

class DemandesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @demande = demandes(:one)
  end

  test "should get index" do
    get demandes_url
    assert_response :success
  end

  test "should get new" do
    get new_demande_url
    assert_response :success
  end

  test "should create demande" do
    assert_difference("Demande.count") do
      post demandes_url, params: { demande: { commentaires: @demande.commentaires, mail: @demande.mail, nom: @demande.nom, telephone: @demande.telephone, type_demande: @demande.type_demande } }
    end

    assert_redirected_to demande_url(Demande.last)
  end

  test "should show demande" do
    get demande_url(@demande)
    assert_response :success
  end

  test "should get edit" do
    get edit_demande_url(@demande)
    assert_response :success
  end

  test "should update demande" do
    patch demande_url(@demande), params: { demande: { commentaires: @demande.commentaires, mail: @demande.mail, nom: @demande.nom, telephone: @demande.telephone, type_demande: @demande.type_demande } }
    assert_redirected_to demande_url(@demande)
  end

  test "should destroy demande" do
    assert_difference("Demande.count", -1) do
      delete demande_url(@demande)
    end

    assert_redirected_to demandes_url
  end
end
