RSpec.describe RawData, type: :model do
  include Tinder
  include_context 'raw data'

  it { should respond_to(:to_updates) }
  it { should respond_to(:to_recommendations) }

  context '#to_recommendations' do
    subject { raw_data_recommendations.to_recommendations }
    it { should be_an(Array) }
  end

  context '#to_updates' do
    subject { create(:raw_data_updates).to_updates }
    it { should be_an(Tinder::Updates) }
  end

  context '#to_profile' do
    subject { create(:raw_data_profile).to_profile }
    it { should be_a(Tinder::ActiveProfile) }
  end

end