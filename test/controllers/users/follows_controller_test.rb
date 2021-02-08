require "test_helper"

class Users::FollowersControllerTest < ActionDispatch::IntegrationTest
  setup { sign_in_as users(:nixon) }

  test "following someone" do
    assert_difference("Relationship.count") do
       post user_follow_url(users(:daniel))
    end

    assert_redirected_to users(:daniel)
    assert_equal flash[:notice], "You are now following #{users(:daniel).name}"
  end

  test "following someone already following" do
    assert_raises ActiveRecord::RecordInvalid do
      post user_follow_url(users(:javier))
    end
  end
end
