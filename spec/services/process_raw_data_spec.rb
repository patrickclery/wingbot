module RSpec
  ### All the Process* services use this same pattern of tests
  shared_context 'process data' do
    subject { described_class.call }
    it { should be true }
    it { expect(described_class).to respond_to(:call) }

    let(:api_token) { "eyJhbGciOiJIUzI1NiJ9.MTc3ODk5MDk4MDM.5q4R0H08rE0Dd9KgxMPp6jcTfIBLCXgEuVZfC9znJTE" }
    let!(:raw_profile) { create(:raw_data_profile) }
    let!(:raw_recommendations) { create(:raw_data_recommendations) }
    let!(:raw_updates) { create(:raw_data_updates) }
  end

  shared_context 'an account has been imported' do
    let!(:account) { create(:account, tinder_id: 'AAAAAAAAAAAAAAAAAAAAAAAA') }
  end
  shared_context 'a person has been imported' do
    let!(:person) { create(:person, tinder_id: 'BBBBBBBBBBBBBBBBBBBBBBBB') }
  end


  describe ProcessRawData, type: :service do
    include_context 'process data'

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

    it { expect { subject }.to change { Person.count }.by(4) }
    it { expect { subject }.to change { Match.count }.by(1) }
    it { expect { subject }.to change { Message.count }.by(18) }
  end

  describe ProcessProfile, type: :service do
    include_examples 'process data'

    it { expect { subject }.to change { Account.count }.by(1) }
    it { expect { subject }.to change { RawData.where(imported_at: nil, tag: 'profile').count }.from(1).to(0) }
  end

  describe ProcessRecommendations, type: :service do
    include_examples 'process data'

    it { expect { subject }.to change { Account.count }.by(1) }
    it { expect { subject }.to change { Person.count }.by(4) }
    it { expect { subject }.to change { RawData.where(imported_at: nil, tag: 'recommendations').count }.from(1).to(0) }

    include_context 'an account has been imported' do
      it { expect { subject }.not_to change { Account.count } }
    end
  end

  describe ProcessUpdates, type: :service do
    include_examples 'process data'

    it { expect { subject }.to change { Account.count }.by(1) }
    # Updates only has one match / person in updates_with_one_match.json
    it { expect { subject }.to change { Person.count }.by(1) }
    it { expect { subject }.to change { Match.count }.by(1) }
    it { expect { subject }.to change { Message.count }.by(18) }
    it { expect { subject }.to change { RawData.where(imported_at: nil, tag: 'updates').count }.from(1).to(0) }
  end
end