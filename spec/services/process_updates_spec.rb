RSpec.describe ProcessUpdates, type: :service do
  subject { described_class }

  let!(:raw_updates) { create(:raw_data_updates) }
  it { should respond_to(:call).with(0).arguments }

  describe '#call' do
    shared_examples 'imports records and marks as imported' do
      subject { described_class.call }
      it { expect(subject).to be true }
      it { expect { subject }.to change { Match.count }.by(1) }
      it { expect { subject }.to change { Message.count }.by(18) }
      it { expect { subject }.to change { RawData.where(imported_at: nil, tag: 'updates').count }.from(1).to(0) }
    end

    context 'when account does not exists' do
      it { expect { subject }.to change { Account.count }.by(1) }
      it { expect { subject }.to change { Person.count }.by(1) }
      include_examples 'imports records and marks as imported'
    end

    context 'when account exists' do
      let!(:account) { create(:account, tinder_id: 'AAAAAAAAAAAAAAAAAAAAAAAA') }
      let!(:person) { create(:person, account: account, tinder_id: 'BBBBBBBBBBBBBBBBBBBBBBBB') }

      it { expect { subject }.not_to change { Account.count } }
      it { expect { subject }.not_to change { Person.count } }
      include_examples 'imports records and marks as imported'
    end

  end

end