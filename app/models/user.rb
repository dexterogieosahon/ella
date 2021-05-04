class User < ApplicationRecord
  has_many :meeting_users
  has_many :meetings, through: :meeting_users

  has_many :timeslot_users
  has_many :timeslots, through: :timeslot_users
end
