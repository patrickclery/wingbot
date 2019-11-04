RSpec.describe Account, type: :model do

  let(:raw_recommendations) { create(:raw_data_recommendations) }
  let(:raw_updates) { create(:raw_data_updates) }
  let(:raw_profile) { create(:raw_data_profile) }

  it { should have_many(:profiles) }
  it { should have_db_column(:tinder_id).of_type(:string) }
  it { should have_db_column(:email).of_type(:string) }
  it { should have_db_column(:name).of_type(:string) }
  it { should have_db_column(:phone_number).of_type(:string) }
  it { should have_db_column(:is_active).of_type(:boolean) }
  it { should have_db_column(:is_email_verified).of_type(:boolean) }
  it { should have_db_column(:last_active_at).of_type(:datetime) }

  describe '#from_profile' do
    subject { Account.from_profile(raw_profile.to_profile) }
    it { expect(subject).to be_a(Account) }

    describe '#save' do
      it { expect { subject.save }.to change { Account.count }.by(1)}
    end
  end

end
