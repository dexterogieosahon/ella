class Meeting < ApplicationRecord
  enum status: %w(pending accepted rejected cancelled rescheduled)
end
