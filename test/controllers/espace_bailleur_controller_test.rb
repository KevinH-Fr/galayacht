require "test_helper"

class EspaceBailleurControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get espace_bailleur_index_url
    assert_response :success
  end
end
