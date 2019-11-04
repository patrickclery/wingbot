RSpec.describe Profile, type: :model do

  let(:account) { create(:account) }
  let(:raw_profile) { create(:raw_data_profile) }
  let(:profile) { raw_profile.to_profile }

  describe 'schema' do
    it { should belong_to(:account) }
    it { should have_db_column(:name).of_type(:string).with_options(presence: true) }
    it { should have_db_column(:account_id).of_type(:integer).with_options(presence: true) }
    it { should have_db_column(:is_active).of_type(:boolean).with_options(presence: true) }
    it { should have_db_column(:data).of_type(:json) }
  end

  describe '#from_profile' do
    subject { Profile.from_profile(raw_profile.to_profile) }
    it { expect(subject).to be_a(Profile) }
  end

  it 'creates a new profile on an existing account' do
    subject.account = account
    expect { subject.save }.to change { Profile.count }.by(1)
  end
end
