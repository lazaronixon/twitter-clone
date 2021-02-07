require "test_helper"

class Users::FollowingControllerTest < ActionDispatch::IntegrationTest
  setup { sign_in_as users(:nixon) }

  test "should get show" do
    get user_following_url(users(:nixon))
    assert_response :success
  end
end
