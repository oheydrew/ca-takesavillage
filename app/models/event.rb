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
  
  before_save :convert_hours_to_seconds
  def convert_hours_to_seconds
    seconds = duration.to_i * (60 * 60)
    self[:duration] = seconds
  end

  def image_display(args)
    if image_data
      image_url(args)
    else
      'http://placehold.it/350/4AAA94/000000?text=Image_Placehold'
    end
  end

  def event_time
    date = start_date
    time = start_time
    event_time = date.to_datetime + time.seconds_since_midnight.seconds

    event_time.strftime('%A, %d %b %Y %l:%M %p')
  end

  def full_address
    "#{street}, #{suburb}, #{state} #{country_code}"
  end

  # SEARCH: Trying out scopes for search
  scope :location, -> (search_term) { where("suburb ILIKE ?", "%#{search_term}%") }
  scope :title_contains, -> (search_term) { where("title ILIKE ?", "%#{search_term}%") }

  def self.search_title(search_terms)
    words = search_terms.split(' ')
    result = []

    words.each do |word|
      events = Event.title_contains(word)
      events.each do |event|
        result << event
      end
    end
    result
  end

end
