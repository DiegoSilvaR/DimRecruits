require "test_helper"

class AccountCreationRequestsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get account_creation_requests_new_url
    assert_response :success
  end

  test "should get create" do
    get account_creation_requests_create_url
    assert_response :success
  end
end
