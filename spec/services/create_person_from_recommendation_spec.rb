RSpec.describe CreateAccountFromProfile, type: :service do
  subject { described_class }

  let!(:raw_profile) { create(:raw_data_profile) }
  let!(:profile) { Tinder::ActiveProfile.new(raw_profile.data) }

  it { should respond_to(:call).with(1).argument }
  describe '#call' do
    subject { described_class.call(profile) }
    it { expect(subject).to be_a(Account) }
    it { expect { subject }.to change { Account.count }.by(1) }
  end
end