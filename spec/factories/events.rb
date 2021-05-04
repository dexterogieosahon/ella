FactoryBot.define do
  factory :event do
    name { Faker::Job.title }
    date { Date.today }

    transient do
      timeslots_count { 7 }
    end

    trait :with_timeslots do
      after(:create) do |event, evaluator|
        create_list(:timeslot, evaluator.timeslots_count, event: event)
      end
    end
  end
end
