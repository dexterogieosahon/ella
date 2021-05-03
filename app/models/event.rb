class Event < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :date, presence: true

  has_many :timeslots, dependent: :destroy
end
