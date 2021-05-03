# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
event = Event.where(name: 'myeve').first_or_create(name: 'myeve', date: Date.today)
13.times { |e| Timeslot.create(event: event, starts_at: Time.now, ends_at: Time.now+3*1+e) }
