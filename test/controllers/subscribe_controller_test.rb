require 'test_helper'

class SubscribeControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get subscribe_new_url
    assert_response :success
  end

  test "should get create" do
    get subscribe_create_url
    assert_response :success
  end

  test "should get created" do
    get subscribe_created_url
    assert_response :success
  end

  test "should get confirm" do
    get subscribe_confirm_url
    assert_response :success
  end

  test "should get complete" do
    get subscribe_complete_url
    assert_response :success
  end

end
