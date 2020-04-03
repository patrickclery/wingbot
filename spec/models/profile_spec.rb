RSpec.describe Profile, type: :model do

  let(:profile) { raw_profile.to_profile }

  describe "associations" do
    it { should belong_to(:account).autosave(true) }
  end

  describe 'schema' do
    it { should have_db_column(:name).of_type(:string) }
    it { should have_db_column(:account_id).of_type(:integer) }
    it { should have_db_column(:bio).of_type(:text) }
    it { should have_db_column(:birthdate).of_type(:date) }
    it { should have_db_column(:city).of_type(:string) }
    it { should have_db_column(:gender).of_type(:string) }
    it { should have_db_column(:hide_age).of_type(:boolean) }
    it { should have_db_column(:hide_distance).of_type(:boolean) }
    it { should have_db_column(:instagram_username).of_type(:string) }
    it { should have_db_column(:is_traveling).of_type(:boolean) }
    it { should have_db_column(:name).of_type(:string) }
    it { should have_db_column(:photos).of_type(:text) }
    it { should have_db_column(:schools).of_type(:text) }
    it { should have_db_column(:jobs).of_type(:text) }
    it { should have_db_column(:tinder_id).of_type(:string) }
    # Timestamps
    it { should have_db_column(:active_at).of_type(:datetime) }
    it { should have_db_column(:created_at).of_type(:datetime) }
    it { should have_db_column(:updated_at).of_type(:datetime) }
  end

  describe "validations" do
    it { should validate_presence_of(:account) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:tinder_id) }
  end

  describe '#from_profile' do
    let(:raw_profile) { create(:raw_data_profile) }

    subject { Profile.from_profile(raw_profile.to_profile) }
    it { expect(subject).to be_a(Profile) }
  end
end
