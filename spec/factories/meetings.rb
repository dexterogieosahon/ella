FactoryBot.define do
  factory :meeting do
    name { Faker::Job.title }
    starts_at { "2021-05-03 13:44:38" }
    ends_at { "2021-05-03 13:44:38" }
    location { "MyString" }
  end
end
