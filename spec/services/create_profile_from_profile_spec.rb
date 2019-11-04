RSpec.describe CreateProfileFromProfile, type: :service do

  let(:account) { create(:account) }
  let(:raw_profile) { create(:raw_data_profile) }

  describe '#call' do
    subject { CreateProfileFromProfile.call(raw_profile.data) }
    it { expect(subject).to be_a(Profile) }
    it { expect { subject }.to change { Profile.count }.by(1) }
  end
end