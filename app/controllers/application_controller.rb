class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def error_messages object
    object.errors.full_messages.join('<br>').html_safe
  end

  def current_party
    @current_party ||= current_user.parties.active.last
  end

  def active_party?
    @current_party.present?
  end
  helper_method :current_party, :active_party?

end
