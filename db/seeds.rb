# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.first_or_create(first_name: 'Jon', last_name: 'Wash', company_name: 'TheInn', company_title: 'Sales Manager')

event = Event.where(name: 'regionals').first_or_create(name: 'regionals', date: Date.today)
13.times { |e| Timeslot.create(event: event, starts_at: Time.now, ends_at: Time.now+3*1+e) }

5.times do |e|
  Meeting.create(starts_at: Time.now, ends_at: Time.now+3*1+e, timeslot: Timeslot.all.sample)
end

Meeting.all.each do |meeting|
  MeetingUser.invite(user, meeting)
end

Timeslot.all[0..7].each do |timeslot|
  TimeslotUser.bookmark(user, timeslot, 'reserved')
end