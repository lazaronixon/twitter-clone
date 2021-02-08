require "application_system_test_case"

class TweetsTest < ApplicationSystemTestCase
  setup { sign_in_as users(:nixon) }

  test "creating a new tweet" do
    visit tweets_url
    click_on "Tweet"

    fill_in "What's happening?", with: "parangaricutirimirruaro"
    click_on "Create Tweet"

    assert_text "Tweet was successfully created"
  end
end
