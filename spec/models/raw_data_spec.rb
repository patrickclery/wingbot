RSpec.describe RawData, type: :model do

  describe "associations" do
    it { should belong_to(:account).autosave(true) }
  end

  describe "schema" do
    it { should have_db_column(:data).of_type(:json) }
    it { should have_db_column(:imported_at).of_type(:datetime) }
    it { should have_db_column(:tag).of_type(:string) }
    it { should have_db_column(:created_at).of_type(:datetime) }
    it { should have_db_column(:updated_at).of_type(:datetime) }
  end

  describe "validations" do
    it { should validate_presence_of(:account) }
  end

  describe '#mark_as_imported!' do
    # Eager load
    subject! { create(:raw_data_profile) }

    it { expect(subject.mark_as_imported!).to be true }
    it { expect { subject.mark_as_imported! }.to change { RawData.where(imported_at: nil, tag: 'profile').count } }
  end

  describe '#to_profile' do
    subject { create(:raw_data_profile) }

    it { should respond_to(:to_profile) }
    it { expect(subject.to_profile).to be_a(Tinder::ActiveProfile) }
  end

  describe '#to_recommendations' do
    subject { create(:raw_data_recommendations) }

    it { should respond_to(:to_recommendations) }
    it { expect(subject.to_recommendations).to be_an(Array) }
  end

  describe '#to_updates' do
    subject { create(:raw_data_updates) }

    it { should respond_to(:to_updates) }
    it { expect(subject.to_updates).to be_a(Tinder::Updates) }
  end
end
