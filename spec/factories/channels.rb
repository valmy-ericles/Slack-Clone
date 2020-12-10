FactoryBot.define do
  factory :channel do
    slug { %w[onebitcode microsoft google].sample }
    team
    user { team.user }
  end
end
