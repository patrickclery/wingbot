FactoryBot.define do
  factory :account do
    tinder_id { Faker::Alphanumeric.alpha(number: 24) }
  end
end