require "test_helper"

class EspacePermisControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get espace_permis_index_url
    assert_response :success
  end
end
