require 'test_helper'

class FacebookControllerTest < ActionController::TestCase
  test "should get connect" do
    get :connect
    assert_response :success
  end

  test "should get callback" do
    get :callback
    assert_response :success
  end

  test "should get user_updates" do
    get :user_updates
    assert_response :success
  end

end
