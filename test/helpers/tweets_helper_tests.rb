class TweetsHelperTest < ActionView::TestCase
  setup do
    @tweet = tweets(:i_am_so_happy)
  end

  test "should return formatted tweet header" do
    assert_dom_equal %{<strong>#{@tweet.user.name}</strong>, @#{@tweet.user} - #{l @tweet.created_at, format: :long}}, tweet_header(@tweet)
  end
end
