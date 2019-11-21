require 'test_helper'

class AuthenticateControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get authenticate_login_url
    assert_response :success
  end

end
