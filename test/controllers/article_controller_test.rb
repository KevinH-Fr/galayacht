require "test_helper"

class ArticleControllerTest < ActionDispatch::IntegrationTest
  test "should get location-bateau-cannes" do
    get article_location-bateau-cannes_url
    assert_response :success
  end
end
