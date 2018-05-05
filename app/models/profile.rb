class Profile < ApplicationRecord
  belongs_to :user

  validates :user_id, :first_name, :last_name, presence: true

  include ImageUploader::Attachment.new(:avatar)

  def full_name
    "#{first_name} #{last_name}"
  end

  def avatar_display(args)
    if avatar_data
      avatar_url(args)
    else
      "http://placehold.it/350/4AAA94/000000"
    end
  end
end
