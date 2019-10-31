RSpec.describe Account, type: :model do
  include_context 'raw data'

  it { should have_many(:profiles) }
  it { should have_db_column(:tinder_id).of_type(:string) }
  it { should have_db_column(:email).of_type(:string) }
  it { should have_db_column(:name).of_type(:string) }
  it { should have_db_column(:is_active).of_type(:boolean) }
  it { should have_db_column(:is_email_verified).of_type(:boolean) }

  describe '#from_profile' do
    subject { described_class.from_profile(profile: profile) }
    it { should be_a(described_class) }
    it { expect { subject }.to change { Account.count }.by(1) }
  end

end