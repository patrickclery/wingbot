RSpec.describe ProcessRecommendations, type: :service do

  subject { described_class }
  let!(:raw_recommendations) { create_list(:raw_data_recommendations, 3) }
  let!(:raw_recommendation) { raw_recommendations.sample }

  it { should respond_to(:call) }
  describe '#call' do
    subject { described_class.call }
    it { expect { subject }.to change { Account.count }.by(1) }
    it { expect { subject }.to change { RawData.where(imported_at: nil, tag: 'recommendations').count }.from(3).to(0) }
    it { expect(subject).to be true }
  end

end
