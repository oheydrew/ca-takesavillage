class Event < ApplicationRecord
  # Users through tickets
  has_many :tickets
  has_many :users_attending, through: :tickets, source: :user

  # Event ownership
  belongs_to :owner, class_name: 'User'

  validates :owner, :title, presence: true
  validates :price, :start_date, :start_time, :duration,
            :street, :suburb, :state, :country_code, presence: true

  validates_time :start_time
  validates_date :start_date, on_or_after: :today

  include ImageUploader::Attachment.new(:image)

  after_create :default_values

  def default_values
 
  end

  def image_display(args)
    if image_data
      image_url(args)
    else
      'http://placehold.it/350/4AAA94/000000?text=Image_Placehold'
    end
  end

  def event_time
    # date = Date.parse('start_date')
    # time = Time.parse('start_time')
    date = start_date
    time = start_time
    event_time = date.to_datetime + time.seconds_since_midnight.seconds

    event_time.strftime('%A, %d %b %Y %l:%M %p')
  end
  # time = DateTime.parse('14:00').strftime("%H:%M")
  # date = Date.parse '1984-07-14'
  # Date.new(2015, 2, 10).to_datetime + Time.parse("16:30").seconds_since_midnight.seconds

  def full_address
    "#{street}, #{suburb}, #{state} #{country_code}"
  end
end
