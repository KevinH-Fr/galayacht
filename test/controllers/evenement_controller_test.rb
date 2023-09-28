require "test_helper"

class EvenementControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get evenement_index_url
    assert_response :success
  end
end
