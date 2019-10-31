RSpec.describe RawData, type: :model do

  include_context 'raw data'

  it { should respond_to(:to_updates) }
  it { should respond_to(:to_recommendations) }

  context '#to_recommendations' do
    subject { raw_data_recommendations.to_recommendations }
    it { should be_an(Array) }
  end

  context '#to_updates' do
    subject { create(:raw_data_updates).to_updates }
    it { is_expected.to be_a(Tinder::Updates) }
  end

end