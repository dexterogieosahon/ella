class Meeting < ApplicationRecord
  enum status: %w(pending accepted rejected cancelled rescheduled)

  attribute :uuid, :uuid, default: -> { SecureRandom.uuid }

  belongs_to :timeslot
  has_many :meeting_users
  has_many :users, through: :meeting_users

  def self.active_for(user)
    joins(:meeting_users)
    .where(meeting_users: { user_id: user.id, 
                            status: %w(pending accepted rescheduled) })
  end
end
