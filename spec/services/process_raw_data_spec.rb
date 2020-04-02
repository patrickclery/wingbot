module RSpec
  ### All the Process* services use this same pattern of test
  shared_context 'raw data exists and is awaiting import' do
    subject { described_class.call }

    let!(:account) { create(:account) }
    let!(:raw_profile) { create(:raw_data_profile, account: account) }
    let!(:raw_recommendations) { create(:raw_data_recommendations, account: account) }
    let!(:raw_updates) { create(:raw_data_updates, account: account) }
  end

  #############################################################################
  describe ProcessProfile do
    include_context 'raw data exists and is awaiting import'


    it { should be true }
    it { expect(described_class).to respond_to(:call) }
    it { expect { subject }.to change { Account.count }.by(1) }
    it { expect { subject }.to change { Profile.count }.by(1) }
    it { expect { subject }.to change { RawData.where(imported_at: nil, tag: 'profile').count }.from(1).to(0) }
  end
  #############################################################################
  describe ProcessRecommendations do
    include_context 'raw data exists and is awaiting import'

    it { should be true }
    it { expect(described_class).to respond_to(:call) }
    it { expect { subject }.not_to change { Account.count } }
    it { expect { subject }.to change { Person.count }.by(4) }
    it { expect { subject }.to change { RawData.where(imported_at: nil, tag: 'recommendations').count }.from(1).to(0) }
  end

  #############################################################################
  describe ProcessUpdates do
    include_context 'raw data exists and is awaiting import'

    it { should be true }
    it { expect(described_class).to respond_to(:call) }
    # Updates only has one match / person in updates_with_one_match.json
    it { expect { subject }.to change { Account.count }.by(1) }
    it { expect { subject }.to change { Person.count }.by(1) }
    it { expect { subject }.to change { Match.count }.by(1) }
    it { expect { subject }.to change { Message.count }.by(18) }
    it { expect { subject }.to change { RawData.where(imported_at: nil, tag: 'updates').count }.from(1).to(0) }
  end

  #############################################################################
  describe ProcessRawData do
    include_context 'raw data exists and is awaiting import'

    it { should be true }
    it { expect(described_class).to respond_to(:call) }
    it 'imports data in logical order' do
      # Stubs real work - we only care about order
      allow(ProcessProfile).to receive(:call).and_return(true)
      allow(ProcessRecommendations).to receive(:call).and_return(true)
      allow(ProcessUpdates).to receive(:call).and_return(true)

      expect(ProcessProfile).to receive(:call).ordered
      expect(ProcessRecommendations).to receive(:call).ordered
      expect(ProcessUpdates).to receive(:call).ordered

      subject
    end

    it { expect { subject }.to change { Account.count }.by(1) }
    it { expect { subject }.to change { Person.count }.by(5) }
    it { expect { subject }.to change { Match.count }.by(1) }
    it { expect { subject }.to change { Message.count }.by(18) }
    it { expect { subject }.to change { RawData.where(imported_at: nil).count }.by(-3) }
  end
end