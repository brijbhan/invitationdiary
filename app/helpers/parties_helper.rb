module PartiesHelper
  def get_latitude_by_ip
    request.location.try(:latitude)
  end

  def get_longitude_by_ip
    request.location.try(:longitude)
  end
end
