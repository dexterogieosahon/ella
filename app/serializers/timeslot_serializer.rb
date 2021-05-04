class TimeslotSerializer < BaseSerializer
  attributes :event_id, :starts_at, :ends_at
  belongs_to :event
  has_many :meetings do |timeslot, params|
  	Timeslot.user_active_meetings(params[:current_user])
  end
end
