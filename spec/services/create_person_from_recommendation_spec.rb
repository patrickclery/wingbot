RSpec.describe CreatePersonFromRecommendation, type: :service do
  subject { described_class }

  let!(:account) { create(:account) }
  let!(:raw_recommendations) { create(:raw_data_recommendations) }
  let!(:recommendation) { Tinder::Recommendation.new(raw_recommendations.data.sample) }

  it { should respond_to(:call).with(1).argument }
  describe '#call' do
    subject { described_class.call(recommendation) }
    it { expect(subject).to be_a(Person) }
    it { expect { subject }.to change { Person.count }.by(1) }
  end
end