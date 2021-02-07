require "test_helper"

class Users::FollowersControllerTest < ActionDispatch::IntegrationTest
  setup { sign_in_as users(:nixon) }

  test "should get show" do
    get user_followers_url(users(:nixon))
    assert_response :success
  end
end
