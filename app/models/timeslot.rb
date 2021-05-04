class Timeslot < ApplicationRecord
  validates :starts_at, presence: true
  validates :ends_at, presence: true

  belongs_to :event
  has_many :meetings

  has_many :timeslot_users, -> { where({ status: 'reserved'}) }
  has_many :users, through: :timeslot_users

  scope :user_active_meetings, -> (user) { Meeting.active_for(user) }
end