RSpec.describe ProcessUpdates, type: :service do
  include_context 'raw data'
  include_context 'default'
  subject { described_class.call }

  before { create(:account) }

  it { expect { subject }.to change { Match.count }.by(4) }
  it { expect(subject).to be true }

  it { expect { subject }.to change { RawData.where(imported_at: nil, tag: 'updates').count }.to(0) }
end