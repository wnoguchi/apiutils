require 'test_helper'

class V1::Network::DnsControllerTest < ActionController::TestCase
  test "should get lookup" do
    get :lookup
    assert_response :success
  end

end
