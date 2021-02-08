require "test_helper"

class User::FeedableTest < ActiveSupport::TestCase
  test "should be seeing my tweets" do
    assert users(:nixon).feed.exists?(tweets(:i_am_so_happy).id)
  end

  test "should be seeing following tweets" do
    assert users(:nixon).feed.exists?(tweets(:i_am_so_happy_too).id)
  end
end
