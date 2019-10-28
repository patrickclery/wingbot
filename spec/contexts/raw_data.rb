RSpec.shared_context 'raw data' do
  let!(:raw_datas) { create_list(:raw_data_recommendation, 3) }
  let!(:recommendation) { raw_datas.sample }

  let!(:updates) do
    gem_dir    = Gem::Specification.find_by_name("tinder_client").gem_dir
    json_parse = JSON.parse(File.read(File.join("#{gem_dir}/spec/tinder/fixtures/updates.json")))
    Tinder::Updates.new(json_parse)
  end
end