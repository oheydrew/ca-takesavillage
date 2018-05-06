class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile

  # Events through tickets
  has_many :tickets
  has_many :events_attending, through: :tickets, source: :event

  # Event ownership
  has_many :events_owned, class_name: 'Event', foreign_key: :owner_id

end
