class EventSerializer < BaseSerializer
  attributes :name, :date

  has_many :timeslots
end
