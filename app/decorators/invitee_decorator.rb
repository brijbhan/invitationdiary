class InviteeDecorator < Draper::Decorator
  delegate_all

  def full_address
    address = [object.street, object.city]
    address.join(', ').titleize + ', ' + object.state.try(:upcase)
  end

  def is_invited
    if object.is_invited?
      content = h.content_tag(:span, 'Yes', class: 'invited-label')
      content += h.pluralize(object.call_count, 'time')
      content.html_safe
    else
      h.content_tag(:span, 'No', class: 'not-invited-label')
    end
  end
end
