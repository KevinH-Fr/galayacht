require "test_helper"

class PreneursControllerTest < ActionDispatch::IntegrationTest
  setup do
    @preneur = preneurs(:one)
  end

  test "should get index" do
    get preneurs_url
    assert_response :success
  end

  test "should get new" do
    get new_preneur_url
    assert_response :success
  end

  test "should create preneur" do
    assert_difference("Preneur.count") do
      post preneurs_url, params: { preneur: { mail: @preneur.mail, nom: @preneur.nom, prenom: @preneur.prenom, telephone: @preneur.telephone } }
    end

    assert_redirected_to preneur_url(Preneur.last)
  end

  test "should show preneur" do
    get preneur_url(@preneur)
    assert_response :success
  end

  test "should get edit" do
    get edit_preneur_url(@preneur)
    assert_response :success
  end

  test "should update preneur" do
    patch preneur_url(@preneur), params: { preneur: { mail: @preneur.mail, nom: @preneur.nom, prenom: @preneur.prenom, telephone: @preneur.telephone } }
    assert_redirected_to preneur_url(@preneur)
  end

  test "should destroy preneur" do
    assert_difference("Preneur.count", -1) do
      delete preneur_url(@preneur)
    end

    assert_redirected_to preneurs_url
  end
end
