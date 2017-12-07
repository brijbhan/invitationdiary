class Party < ApplicationRecord
  has_one    :invitation, dependent: :destroy
  has_many   :invitees, dependent: :destroy
  belongs_to :user

  scope :active, -> { where(is_active: true) }

  geocoded_by :venue, latitude: :lat, longitude: :lng
  after_validation :geocode, if: -> (obj) { obj.venue.present? and obj.venue_changed? }
end
