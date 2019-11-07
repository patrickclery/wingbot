RSpec.describe RawData, type: :model do

  subject { RawData.new(account: account) }

  let!(:account) { create(:account, tinder_id: 'AAAAAAAAAAAAAAAAAAAAAAAA') }
  let!(:person) { create(:person, account: account, tinder_id: 'BBBBBBBBBBBBBBBBBBBBBBBB') }

  let!(:raw_recommendations) { create(:raw_data_recommendations) }
  let!(:raw_updates) { create(:raw_data_updates) }
  let!(:raw_profile) { create(:raw_data_profile) }

  # It makes things a LOT easier to save the account_id that was used
  # Instead of using magic to retrieve it later, just in case the order
  # was missed.
  it { should belong_to(:account).required.autosave(true) }
  it { should have_db_column(:data).of_type(:json) }
  it { should have_db_column(:imported_at).of_type(:datetime) }
  it { should have_db_column(:tag).of_type(:string) }
  it { should have_db_column(:created_at).of_type(:datetime) }
  it { should have_db_column(:updated_at).of_type(:datetime) }

  it { should respond_to(:to_recommendations) }
  describe '#to_recommendations' do
    subject { raw_recommendations.to_recommendations }
    it { should be_an(Array) }
  end

  it { should respond_to(:to_updates) }
  describe '#to_updates' do
    subject { raw_updates.to_updates }
    it { should be_an(Tinder::Updates) }
  end

  it { should respond_to(:to_profile) }
  describe '#to_profile' do
    subject { raw_profile.to_profile }
    it { should be_a(Tinder::ActiveProfile) }
  end

  it { should respond_to(:mark_as_imported!) }
  describe '#mark_as_imported!' do
    subject { raw_profile.mark_as_imported! }
    it { expect(subject).to be true }
    it { expect { subject }.to change { RawData.where(imported_at: nil, tag: 'profile').count } }
  end
end
