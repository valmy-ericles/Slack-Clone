FactoryBot.define do
  factory :message do
    body { Faker::Lorem.sentence }
    user
  end
end
