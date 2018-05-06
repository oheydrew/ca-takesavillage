class Event < ApplicationRecord
  # Users through tickets
  has_many :tickets
  has_many :users_attending, through: :tickets, source: :user

  # Event ownership
  belongs_to :owner, class_name: 'User'

  validates :owner, :title, presence: true
  # validates :price, :start_date, :start_time, :duration,
  #           :street, :suburb, :state, :country_code, presence: true
end
