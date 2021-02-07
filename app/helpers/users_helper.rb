module UsersHelper
  def at(user)
    "@#{user.username}"
  end

  def format_user(user)
    "#{user.name} (#{at user})"
  end
end
