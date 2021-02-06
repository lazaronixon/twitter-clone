module TestApplicationHelper
  def sign_in_as(user)
    post sign_in_url(user: { username: user.username, password: "secret" })
  end
end
