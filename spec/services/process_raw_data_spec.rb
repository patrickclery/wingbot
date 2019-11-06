RSpec.describe ProcessRawData, type: :service do
  subject { described_class }
  it { should respond_to(:call) }

  describe '#call' do
    subject { described_class.call }
    it { expect(subject).to be true }

    # https://relishapp.com/rspec/rspec-mocks/docs/setting-constraints/message-order
    it 'imports data in logical order' do
      allow(ProcessProfiles).to receive(:call).and_return(true)
      allow(ProcessRecommendations).to receive(:call).and_return(true)
      allow(ProcessUpdates).to receive(:call).and_return(true)

      expect(ProcessProfiles).to receive(:call).ordered
      expect(ProcessRecommendations).to receive(:call).ordered
      expect(ProcessUpdates).to receive(:call).ordered

      subject
    end

    context 'when raw data exists and is awaiting import' do

      let!(:raw_recommendations) { create(:raw_data_recommendations) }
      let!(:raw_profile) { create(:raw_data_profile) }
      let!(:raw_updates) { create(:raw_data_updates) }

      it { expect { subject }.to change { Account.count }.by(1) }
      it { expect { subject }.to change { Person.count }.by(5) }
      it { expect { subject }.to change { Match.count }.by(1) }
      it { expect { subject }.to change { Message.count }.by(18) }
      it { expect { subject }.to change { RawData.where(imported_at: nil).count }.to(0) }
    end
  end
end