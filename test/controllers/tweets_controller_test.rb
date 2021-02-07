require "test_helper"

class TweetsControllerTest < ActionDispatch::IntegrationTest
  setup { sign_in_as users(:nixon) }

  test "should get index" do
    get tweets_url
    assert_response :success
  end

  test "should create tweet" do
    get new_tweet_url
    assert_response :success

    assert_difference("Tweet.count") do
      post tweets_url, params: { tweet: { message: tweets(:i_am_so_happy).message } }
    end

    assert_redirected_to tweets_url
  end
end
