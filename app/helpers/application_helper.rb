module ApplicationHelper
  SERVICE_STATUS_CODE = { temporarily_unavailable: 'warning', not_found: 'danger', ok: 'success' }.freeze

  def markdown(text)
    options = { autolink: false }
    Redcarpet::Markdown.new(Redcarpet::Render::HTML.new, options).render(text).html_safe
  end

  def availability_status(availability)
    SERVICE_STATUS_CODE[availability.to_sym]
  end

  def current_user
    @current_user
  end
end
