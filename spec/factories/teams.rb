FactoryBot.define do
  factory :team do
    slug { Faker::Lorem.word }
    user
  end
end
