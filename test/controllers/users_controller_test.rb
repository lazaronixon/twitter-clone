require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup { sign_in_as users(:nixon) }

  test "should get show by id" do
    get user_url(users(:nixon))
    assert_response :success
  end

  test "should get show by username" do
    get username_url(users(:nixon).username)
    assert_response :success
  end
end
