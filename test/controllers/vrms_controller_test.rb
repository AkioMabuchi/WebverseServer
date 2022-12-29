require "test_helper"

class VrmsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get vrms_index_url
    assert_response :success
  end

  test "should get show" do
    get vrms_show_url
    assert_response :success
  end

  test "should get new" do
    get vrms_new_url
    assert_response :success
  end

  test "should get edit" do
    get vrms_edit_url
    assert_response :success
  end
end
