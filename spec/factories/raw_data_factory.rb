FactoryBot.define do
  factory :raw_data_recommendations, class: RawData do
    imported_at { nil }
    data {
      gem_dir    = Gem::Specification.find_by_name("tinder_client").gem_dir
      json_parse = JSON.parse(File.read(File.join("#{gem_dir}/spec/tinder/fixtures/recommendations_1.json")))
    }
    tag { 'recommendations' }
  end

  factory :raw_data_updates, class: RawData do
    imported_at { nil }
    data { JSON.parse(File.read(File.join(Rails.root, "/spec/fixtures/updates_with_one_match.json"))) }
    tag { 'updates' }
  end

  factory :raw_data_profile, class: RawData do
    imported_at { nil }
    data { JSON.parse(File.read(File.join(Rails.root, "/spec/fixtures/profile.json"))) }
    tag { 'profile' }
  end
end