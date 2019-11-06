RSpec.describe SaveRawData, type: :service do
  subject { described_class }
  it { should respond_to(:call) }
  include_context 'stubs'

  describe '#call' do
    subject { described_class.call(api_token: api_token) }
    it { expect(subject).to be true }

    let(:api_token) { "12a3bc45-a123-123a-1a23-1234abc4de5f" }
    let!(:raw_recommendations) { create(:raw_data_recommendations) }
    let!(:raw_profile) { create(:raw_data_profile) }
    let!(:raw_updates) { create(:raw_data_updates) }

    # https://relishapp.com/rspec/rspec-mocks/docs/setting-constraints/message-order
    it 'imports data in logical order' do
      allow(SaveProfile).to receive(:call).with(api_token: api_token).and_return(true)
      allow(SaveRecommendations).to receive(:call).with(api_token: api_token).and_return(true)
      allow(SaveUpdates).to receive(:call).with(api_token: api_token).and_return(true)

      expect(SaveProfile).to receive(:call).ordered
      expect(SaveRecommendations).to receive(:call).ordered
      expect(SaveUpdates).to receive(:call).ordered

      subject
    end

    it { expect { subject }.to change { RawData.where(imported_at: nil).count }.to(6) }
  end
end