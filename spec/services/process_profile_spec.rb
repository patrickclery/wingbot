RSpec.describe ProcessProfile, type: :service do
  describe '#call' do
    subject { described_class.call }

    let!(:raw_profiles) { create_list(:raw_data_profile, 3) }
    let!(:raw_profile) { raw_profiles.sample }

    it { expect(subject).to be true }
    it { expect { subject }.to change { Account.count }.by(1) }
    it { expect { subject }.to change { RawData.where(imported_at: nil, tag: 'profile').count }.from(3).to(0) }
  end
end