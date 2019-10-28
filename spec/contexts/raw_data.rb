RSpec.shared_context 'raw data' do
  let!(:raw_datas) { create_list(:raw_data_recommendation, 3) }
  let!(:recommendation) { raw_datas.sample }
end