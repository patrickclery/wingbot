RSpec.describe RawData, type: :model do

  let(:raw_recommendations) { create(:raw_data_recommendations) }
  let(:raw_updates) { create(:raw_data_updates) }
  let(:raw_profile) { create(:raw_data_profile) }

  it { should respond_to(:to_recommendations) }
  context '#to_recommendations' do
    subject { raw_recommendations.to_recommendations }
    it { should be_an(Array) }
  end

  it { should respond_to(:to_updates) }
  context '#to_updates' do
    subject { raw_updates.to_updates }
    it { should be_an(Tinder::Updates) }
  end

  it { should respond_to(:to_profile) }
  context '#to_profile' do
    subject { raw_profile.to_profile }
    it { should be_a(Tinder::ActiveProfile) }
  end

end