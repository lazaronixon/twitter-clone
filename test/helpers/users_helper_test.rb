class UsersHelperTest < ActionView::TestCase
  test "should return at username" do
    assert_dom_equal "@lazaronixon", at(users(:nixon))
  end

  test "should return formatted user info" do
    assert_dom_equal "Lázaro Nixon (@lazaronixon)", format_user(users(:nixon))
  end
end
