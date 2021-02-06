module ApplicationHelper
  def title
    content_for(:title) || Rails.application.class.to_s.split("::").first
  end

  def at(user)
    "@#{user.username}"
  end
end
