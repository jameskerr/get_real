require 'test_helper'

class ConnectControllerTest < ActionController::TestCase
  test "should get instagram" do
    get :instagram
    assert_response :success
  end

end
