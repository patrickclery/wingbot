RSpec.describe ProcessRawData, type: :service do
  include_examples 'service object'

  it { expect(subject).to be true }
  it { expect(ProcessUpdates).to receive(:call); subject }

  context {
    before { pending }
    it { expect { subject }.to change { Profile.count }.by(1) }
    it { expect { subject }.to change { Account.count }.by(1) }
    it { expect { subject }.to change { Match.count }.by(4) }
    it { expect { subject }.to change { Person.count }.by(4) }
    it { expect { subject }.to change { Message.count }.by(4) }
    it { expect { subject }.to change { RawData.where(imported_at: nil).count }.to(0) }

    it { pending; expect(ProcessRecommendations).to receive(:call); subject }
    it { pending; expect(ProcessProfile).to receive(:call); subject }
  }

end