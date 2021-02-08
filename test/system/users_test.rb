require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup { sign_in_as users(:nixon) }

  test "following another user by username" do
    visit tweets_url
    click_on "Profile"

    click_on "Following"

    click_on "Follow another user"

    fill_in "Username", with: "danielosorio"
    click_on "Follow user"

    assert_text "User was successfully followed"
  end

  test "following another user by button" do
    visit tweets_url
    click_on "Profile"

    click_on "Followers"

    click_link "Follow", href: user_follow_path(users(:daniel))

    assert_text "You are now following Daniel Osorio"
  end
end
