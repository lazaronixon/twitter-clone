module ApplicationHelper
  def title
    content_for(:title) || "Twitter Clone"
  end
end
