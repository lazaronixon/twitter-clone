require "test_helper"

class RegistrationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:nixon)
  end

  test "signing up" do
    get sign_up_url
    assert_response :success

    assert_difference("User.count") do
      post sign_up_url, params: { user: { name: "Sebastião", username: "sebastiao", email: "sebastiao@hotmail.com", password: "secret", password_confirmation: "secret" } }
    end

    assert_redirected_to root_url
  end

  test "signing up with wrong data" do
    assert_no_difference("User.count") do
      post sign_up_url, params: { user: { name: @user.name, username: @user.username, email: @user.email, password: "secret", password_confirmation: "secret" } }
    end

    assert_response :unprocessable_entity
  end

end
