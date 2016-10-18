class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def error_messages object
    object.errors.full_messages.join('<br>').html_safe
  end
end
