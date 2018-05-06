class Event < ApplicationRecord
  # Users through tickets
  has_many :tickets
  has_many :users_attending, through: :tickets, source: :user

  # Event ownership
  belongs_to :owner, class_name: 'User'
end
