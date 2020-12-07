FactoryBot.define do
  factory :channel do
    slug { Faker::Name.name }
    team
    user { team.user }
  end
end
