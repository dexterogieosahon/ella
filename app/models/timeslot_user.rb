class TimeslotUser < ApplicationRecord
  attribute :status, :string, default: -> { 'reserved' }

  belongs_to :timeslot
  belongs_to :user

  def self.bookmark(user, timeslot, status)
    create(user: user, timeslot: timeslot, status: status)
  end
end
