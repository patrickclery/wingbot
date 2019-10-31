RSpec.describe ProcessRawData, type: :service do
  subject { described_class.call }
  include_context 'default'
  include_context 'raw data'

  it { expect(subject).to be true }
  it { expect { subject }.to change { Profile.count }.by(1) }
  it { expect { subject }.to change { Account.count }.by(1) }
  it { expect { subject }.to change { Match.count }.by(4) }
  it { expect { subject }.to change { Person.count }.by(4) }
  it { expect { subject }.to change { Message.count }.by(4) }
  it { expect { subject }.to change { RawData.where(imported_at: nil).count }.to(0) }

  context 'delegates to subprocesses' do
    it { expect(ProcessUpdates).to receive(:call); subject }
    it { expect(ProcessRecommendations).to receive(:call); subject }
    it { expect(ProcessProfile).to receive(:call); subject }
  end

end