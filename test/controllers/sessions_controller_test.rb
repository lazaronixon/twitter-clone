require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest

  setup do
    @user = users(:nixon)
  end

  test "should get new" do
    get sign_in_url
    assert_response :success
  end

  test "sign in without credentials" do
    get root_url
    assert_redirected_to sign_in_url
  end

  test "sign in with correct credentials" do
    post sign_in_url, params: { user: { username: @user.username, password: 'secret' } }
    assert_redirected_to root_url
  end

  test "sign in with incorrect credentials" do
    post sign_in_url, params: { user: { username: @user.username, password: 'wrong' } }

    assert_equal @user.username, flash[:username_hint]
    assert_redirected_to sign_in_url
  end

  test "leaving the system" do
    delete sign_out_url
    assert_redirected_to sign_in_url

    get root_url
    assert_redirected_to sign_in_url
  end
end
