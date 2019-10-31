RSpec.describe Profile, type: :model do

  include_context 'raw data'

  describe 'schema' do
    it { should belong_to(:account) }
    it { should have_db_column(:name).of_type(:string).with_options(presence: true) }
    it { should have_db_column(:account_id).of_type(:integer).with_options(presence: true) }
    it { should have_db_column(:is_active).of_type(:boolean).with_options(presence: true) }
    it { should have_db_column(:data).of_type(:json) }
  end

  describe 'model' do
    it { should serialize(:data) }
  end

  describe '#from_profile' do
    subject { described_class.from_profile(profile: profile) }
    it { should be_a(described_class) }
    it { expect { subject }.to change { Account.count }.by(1) }
    it { expect { subject }.to change { Profile.count }.by(1) }
  end

end
