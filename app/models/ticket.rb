class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validate :user, uniqueness: { scope: :event }
end
