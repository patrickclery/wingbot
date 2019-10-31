RSpec.describe ProcessUpdates, type: :service do
  include_examples 'service object'

  before { create(:account) }

  it { expect(subject).to be true }
  context {
    before { pending }
    it { expect { subject }.to change { Match.count }.by(4) }
    it { expect { subject }.to change { RawData.where(imported_at: nil, tag: 'updates').count }.to(0) }
  }
end