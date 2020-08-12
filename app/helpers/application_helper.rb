module ApplicationHelper
  def render_flash(type)
    javascript_tag do
      return if flash[type].nil?
      raise 'Unknown flash type' unless %i[alert notice].include?(type)

      if type == :alert
        "showAlertToast('#{flash[:alert]}');".html_safe
      else
        "showNoticeToast('#{flash[:notice]}');".html_safe
      end
    end
  end

  def render_authentication_links
    render user_logged_in? ? 'partials/logout_link' : 'partials/authentication_links'
  end

  def render_form_errors(resource)
    render 'partials/form_errors', resource: resource if resource.errors.any?
  end

  def limit_text(text, len = 100)
    "#{text[..len]}#{text.size > len ? '...' : ''}"
  end
end
