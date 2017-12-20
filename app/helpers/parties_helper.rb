module PartiesHelper
  def get_latitude_by_ip
    request.location.try(:latitude)
  end

  def get_longitude_by_ip
    request.location.try(:longitude)
  end

  def active_icon_class(party)
    if party.is_active?
      'glyphicon glyphicon-ok-circle active-glyph'
    else
      ''
    end
  end
end
