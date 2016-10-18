class Invitee < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :street, presence: true
end
