module ApplicationHelper
  def markdown(text)
    options = { autolink: false }
    Redcarpet::Markdown.new(Redcarpet::Render::HTML.new, options).render(text).html_safe
  end
end
