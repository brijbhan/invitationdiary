module ApplicationHelper
  def active_nav_class(nav = 'parties')
    return 'active' if params[:controller] == nav
  end

  def form_title(object)
  	title = object.new_record? ? 'New' : 'Edit' 
  	"#{title} #{object.class.to_s}".humanize
  end
end
