RSpec.describe ProcessUpdates, type: :service do
  subject { described_class }

  let!(:raw_updates) { create(:raw_data_updates) }

  it { should respond_to(:call).with(0).arguments }
  describe '#call' do
    subject { described_class.call }

    it { expect(subject).to be true }
    it { expect { subject }.to change { Match.count }.by(1) }
    it { expect { subject }.to change { Message.count }.by(18) }
    it { expect { subject }.to change { RawData.where(imported_at: nil, tag: 'updates').count }.from(1).to(0) }
    it { expect(subject) }

    context 'when account already exists' do
      let!(:account) { create(:account, tinder_id: 'AAAAAAAAAAAAAAAAAAAAAAAA') }
      let!(:person) { create(:person, tinder_id:   'BBBBBBBBBBBBBBBBBBBBBBBB') }
      it { expect { subject }.to change { Account.count }.by(1) }
      it { expect { subject }.to change { Person.count }.by(1) }
    end
  end

end