require "test_helper"

class AdminParametersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_parameter = admin_parameters(:one)
  end

  test "should get index" do
    get admin_parameters_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_parameter_url
    assert_response :success
  end

  test "should create admin_parameter" do
    assert_difference("AdminParameter.count") do
      post admin_parameters_url, params: { admin_parameter: { hautesaison: @admin_parameter.hautesaison, remuneration: @admin_parameter.remuneration } }
    end

    assert_redirected_to admin_parameter_url(AdminParameter.last)
  end

  test "should show admin_parameter" do
    get admin_parameter_url(@admin_parameter)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_parameter_url(@admin_parameter)
    assert_response :success
  end

  test "should update admin_parameter" do
    patch admin_parameter_url(@admin_parameter), params: { admin_parameter: { hautesaison: @admin_parameter.hautesaison, remuneration: @admin_parameter.remuneration } }
    assert_redirected_to admin_parameter_url(@admin_parameter)
  end

  test "should destroy admin_parameter" do
    assert_difference("AdminParameter.count", -1) do
      delete admin_parameter_url(@admin_parameter)
    end

    assert_redirected_to admin_parameters_url
  end
end
