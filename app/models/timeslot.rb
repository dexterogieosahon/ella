class Timeslot < ApplicationRecord
  validates :starts_at, presence: true
  validates :ends_at, presence: true

  belongs_to :event
  has_many :meetings
  scope :user_active_meetings, -> (user) { Meeting.active_for(user) }
end
