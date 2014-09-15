require 'test_helper'

class V1::Network::IpControllerTest < ActionController::TestCase
  test "should get ipv4" do
    get :ipv4
    assert_response :success
  end

end
