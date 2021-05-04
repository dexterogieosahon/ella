class MeetingSerializer < BaseSerializer
  attributes :timeslot_id, :name, :uuid, :starts_at, :ends_at, :location
end