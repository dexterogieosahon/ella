class User < ApplicationRecord
  has_many :meeting_users
  has_many :meetings, through: :meeting_users
end
