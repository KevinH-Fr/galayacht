require "test_helper"

class EspacePreneurControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get espace_preneur_index_url
    assert_response :success
  end
end
