class Party < ApplicationRecord
  has_one    :invitation, dependent: :destroy
  has_many   :invitees, dependent: :destroy
  belongs_to :user

  scope :active, -> { where(is_active: true) }
  scope :all_except, ->(party) { where.not(id: party) }

  geocoded_by :venue, latitude: :lat, longitude: :lng
  after_validation :geocode, if: -> (obj) { obj.venue.present? and obj.venue_changed? }

  after_save :inactive_others, if: :is_active

  def inactive_others
    user.parties.active.all_except(self).update_all(is_active: false)
  end
end
