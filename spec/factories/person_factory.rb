FactoryBot.define do
  factory :person do
    tinder_id { Faker::Tinder.id }
  end
end
