FactoryBot.define do
  factory :raw_data_recommendation, class: RawData do
    data {
      gem_dir = Gem::Specification.find_by_name("tinder_client").gem_dir
      json_parse = JSON.parse(File.read(File.join("#{gem_dir}/spec/tinder/fixtures/recommendations_1.json")))
    }
  end

  factory :raw_data_updates, class: RawData do
    data do
      gem_dir = Gem::Specification.find_by_name("tinder_client").gem_dir
      json_parse = JSON.parse(File.read(File.join("#{gem_dir}/spec/tinder/fixtures/updates.json")))
    end
  end
end