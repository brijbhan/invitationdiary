module ApplicationHelper
  def active_nav_class(nav = 'parties')
    return 'active' if params[:controller] == nav
  end
end
