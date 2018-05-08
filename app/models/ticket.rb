class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :user, uniqueness: { scope: :event, message: 'is already attending' }
end
