class MeetingUser < ApplicationRecord
  attribute :status, :string, default: -> { 'pending' }

  belongs_to :meeting
  belongs_to :user

  def self.invite(user, meeting, status)
    create(user: user, meeting: meeting, status: status)
  end
end
