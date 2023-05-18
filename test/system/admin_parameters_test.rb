require "application_system_test_case"

class AdminParametersTest < ApplicationSystemTestCase
  setup do
    @admin_parameter = admin_parameters(:one)
  end

  test "visiting the index" do
    visit admin_parameters_url
    assert_selector "h1", text: "Admin parameters"
  end

  test "should create admin parameter" do
    visit admin_parameters_url
    click_on "New admin parameter"

    fill_in "Hautesaison", with: @admin_parameter.hautesaison
    fill_in "Remuneration", with: @admin_parameter.remuneration
    click_on "Create Admin parameter"

    assert_text "Admin parameter was successfully created"
    click_on "Back"
  end

  test "should update Admin parameter" do
    visit admin_parameter_url(@admin_parameter)
    click_on "Edit this admin parameter", match: :first

    fill_in "Hautesaison", with: @admin_parameter.hautesaison
    fill_in "Remuneration", with: @admin_parameter.remuneration
    click_on "Update Admin parameter"

    assert_text "Admin parameter was successfully updated"
    click_on "Back"
  end

  test "should destroy Admin parameter" do
    visit admin_parameter_url(@admin_parameter)
    click_on "Destroy this admin parameter", match: :first

    assert_text "Admin parameter was successfully destroyed"
  end
end
