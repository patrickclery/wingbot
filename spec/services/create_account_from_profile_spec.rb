RSpec.describe CreateAccountFromProfile, type: :service do

  let(:raw_profile) { create(:raw_data_profile) }

  describe '#call' do
    subject { described_class.call(raw_profile.data) }
    it { expect(subject).to be_a(Account) }
    it { expect { subject }.to change { Account.count }.by(1) }
  end
end