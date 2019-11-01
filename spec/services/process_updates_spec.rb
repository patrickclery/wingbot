RSpec.describe ProcessUpdates, type: :service do
  include_examples 'service object'

  let!(:account) { create(:account, tinder_id: Faker) }

  it { expect(subject).to be true }
  context {
    it { expect { subject }.to change { Match.count }.by(20) }
    it { expect { subject }.to change { Message.count }.by(20) }
    it { expect { subject }.to change { RawData.where(imported_at: nil, tag: 'updates').count }.to(0) }
    it { expect { subject }.to change { account.last_active_at }.to(0) }
  }
end