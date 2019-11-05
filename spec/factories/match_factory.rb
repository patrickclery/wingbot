FactoryBot.define do
  factory :match do
    tinder_match_id { Faker::Tinder.id * 2 }
  end
end
