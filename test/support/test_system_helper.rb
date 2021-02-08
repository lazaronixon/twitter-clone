module TestSystemHelper
  def sign_in_as(user)
    visit sign_in_url

    fill_in :user_username, with: user.username
    fill_in :user_password, with: "secret"
    click_on "Sign in"

    assert_current_path root_path
  end
end
