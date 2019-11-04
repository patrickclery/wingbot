RSpec.describe Account, type: :model do
  include_context 'raw data'

  it { should have_many(:profiles) }
  it { should have_db_column(:tinder_id).of_type(:string) }
  it { should have_db_column(:email).of_type(:string) }
  it { should have_db_column(:name).of_type(:string) }
  it { should have_db_column(:phone_number).of_type(:string) }
  it { should have_db_column(:is_active).of_type(:boolean) }
  it { should have_db_column(:is_email_verified).of_type(:boolean) }
  it { should have_db_column(:last_active_at).of_type(:datetime) }

  describe '#from_profile' do
    subject { Account.from_profile(profile) }
    it { expect(subject).to be_a(Account) }

    describe '#save' do
      it { expect { subject.save }.to change { Account.count }.by(1)}
    end
  end

end
