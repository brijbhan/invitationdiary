class Party < ApplicationRecord
  has_one    :invitation, dependent: :destroy
  has_many   :invitees, dependent: :destroy
  belongs_to :user

  scope :active, -> { where(is_active: true) }
end
