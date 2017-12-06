require 'test_helper'

class ResetPasswordControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get reset_password_new_url
    assert_response :success
  end

  test "should get edit" do
    get reset_password_edit_url
    assert_response :success
  end

  test "should get create" do
    get reset_password_create_url
    assert_response :success
  end

  test "should get update" do
    get reset_password_update_url
    assert_response :success
  end

  test "should get show" do
    get reset_password_show_url
    assert_response :success
  end

end
