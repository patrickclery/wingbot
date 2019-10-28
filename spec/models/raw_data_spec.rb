RSpec.describe RawData, type: :model do

  let!(:raw_datas) { create_list(:raw_data_recommendation, 3) }
  let!(:raw_data_recommendation) { raw_datas.first }

  it { should respond_to(:to_updates) }
  it { should respond_to(:to_recommendation) }

  context '#to_recommendation' do
    subject { create(:raw_data_recommendation).to_recommendation }
    it { is_expected.to be_a(Tinder::Recommendation) }
  end

  context '#to_updates' do
    subject { create(:raw).to_updates }
    it { pending; is_expected.to be_an(Tinder::Updates) }
  end

end