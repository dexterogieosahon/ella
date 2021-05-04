class BookmarkedTimeslotSerializer < BaseSerializer
  attributes :event_id, :starts_at, :ends_at
  belongs_to :event
  has_many :users# do |timeslot, params|
    #Timeslot.bookmarked_users
  #end
end
