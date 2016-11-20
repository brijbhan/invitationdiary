class Invitee < ApplicationRecord
  belongs_to :user

  validates :name, presence: true

  scope :search, -> (search) {
    where("mobile = ? OR name ILIKE ? OR street ILIKE ? OR city ILIKE ? OR state ILIKE ?", search, "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
  }
  scope :is_invited, -> (is_invited) { where(is_invited: is_invited) }
  scope :call_count, -> (call_count) { where(call_count: call_count) }
end
