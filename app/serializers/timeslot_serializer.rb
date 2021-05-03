class TimeslotSerializer < BaseSerializer
  attributes :event_id, :starts_at, :ends_at
  belongs_to :event
end
