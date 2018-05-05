class Profile < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  # validates :avatar, presence: true

  include ImageUploader::Attachment.new(:avatar)

  def full_name
    "#{first_name} #{last_name}"
  end


end
