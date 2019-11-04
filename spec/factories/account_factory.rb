FactoryBot.define do
  factory :account do
    tinder_id { Faker::Tinder.id }
  end
end