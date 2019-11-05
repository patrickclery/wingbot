RSpec.describe ProcessUpdates, type: :service do



  it { expect(subject).to be true }
  it { expect { subject }.to change { Match.count }.by(4) }
  it { expect { subject }.to change { Message.count }.by(4) }
  it { expect { subject }.to change { RawData.where(imported_at: nil, tag: 'updates').count }.from(1).to(0) }
end