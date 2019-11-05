RSpec.describe ProcessUpdates, type: :service do
  subject { described_class }
  let!(:account) { create(:account, tinder_id: '') }
  let!(:person) { create(:person, tinder_id: '5d071adce970261500be5597') }
  let!(:raw_updates) { create(:raw_data_updates) }
  let!(:updates) { raw_updates.to_updates }
  let!(:matches) { updates.matches }
  let!(:match) { create(:match, account: account, person: person, tinder_match_id: '5d071adce970261500be55975d071adce970261500be5597') }

  it { should respond_to(:call).with(1).argument }

  describe '#call' do
    subject { described_class.call(account) }

    it { expect(subject).to be true }
    it { expect { subject }.to change { Match.count }.by(4) }
    it { expect { subject }.to change { Message.count }.by(4) }
    it { expect { subject }.to change { RawData.where(imported_at: nil, tag: 'updates').count }.from(1).to(0) }
  end

end