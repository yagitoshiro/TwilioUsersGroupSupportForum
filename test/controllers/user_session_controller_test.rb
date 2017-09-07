require 'test_helper'

class UserSessionControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get user_session_new_url
    assert_response :success
  end

  test "should get create" do
    get user_session_create_url
    assert_response :success
  end

  test "should get destroy" do
    get user_session_destroy_url
    assert_response :success
  end

end
