class Payment < ApplicationRecord
  belongs_to :user

  validates :user_id, :amount, :description, presence: true

  validates :amount, numericality: true
end
