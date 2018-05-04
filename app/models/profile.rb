class Profile < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  # validates :avatar, presence: true

  include ImageUploader::Attachment.new(:avatar)
end
