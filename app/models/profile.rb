class Profile < ApplicationRecord
  belongs_to :user

  validates :user_id, :first_name, :last_name, presence: true
  validates :user_id, uniqueness: { message: 'can only have one profile.' }

  include ImageUploader::Attachment.new(:avatar)

  after_create :default_values

  def default_values
    tagline = "Excellent at the things I do"
  end

  def avatar_display(args)
    if avatar_data
      avatar_url(args)
    else
      "http://placehold.it/350/4AAA94/000000?text=Avatar_Placehold"
    end
  end

  def full_name
    "#{first_name} #{last_name}".titleize
  end

  def full_address
    "#{street}, #{suburb}, #{state} #{country_code}"
  end
end
