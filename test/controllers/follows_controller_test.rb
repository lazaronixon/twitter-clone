require "test_helper"

class FollowsControllerTest < ActionDispatch::IntegrationTest
  setup { sign_in_as users(:nixon) }

  test "following someone" do
    get new_follow_url
    assert_response :success

    assert_difference("Relationship.count") do
       post follows_url, params: { username: users(:daniel).username }
    end

    assert_redirected_to users(:daniel)
    assert_equal flash[:notice], "User was successfully followed"
  end

  test "following someone that not exists" do
    assert_no_difference("Relationship.count") do
       post follows_url, params: { username: "notfound" }
    end

    assert_redirected_to new_follow_path
    assert_equal flash[:notice], "User not found"
  end

  test "following someone that is already followed" do
    assert_no_difference("Relationship.count") do
       post follows_url, params: { username: "javierfonseca" }
    end

    assert_redirected_to new_follow_path
    assert_equal flash[:notice], "You are already following this user"
  end

end
