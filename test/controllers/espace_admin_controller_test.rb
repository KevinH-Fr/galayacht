require "test_helper"

class EspaceAdminControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get espace_admin_index_url
    assert_response :success
  end
end
