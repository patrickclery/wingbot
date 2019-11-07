RSpec.describe Person, type: :model do

  # Upon import, it should assign the account_id to which it originally came from
  it { should belong_to(:account_id).required }

  it { should have_db_column(:bio).of_type(:text) }
  it { should have_db_column(:birthdate).of_type(:date) }
  it { should have_db_column(:city).of_type(:string) }
  it { should have_db_column(:gender).of_type(:string) }
  it { should have_db_column(:hide_age).of_type(:boolean) }
  it { should have_db_column(:hide_distance).of_type(:boolean) }
  it { should have_db_column(:instagram_id).of_type(:string) }
  it { should have_db_column(:instagram_username).of_type(:string) }
  it { should have_db_column(:is_traveling).of_type(:boolean) }
  it { should have_db_column(:name).of_type(:string) }
  it { should have_db_column(:photos).of_type(:text) }
  it { should have_db_column(:schools).of_type(:text) }
  it { should have_db_column(:tinder_id).of_type(:string) }
  # Timestamps
  it { should have_db_column(:active_at).of_type(:datetime) }
  it { should have_db_column(:created_at).of_type(:datetime) }
  it { should have_db_column(:updated_at).of_type(:datetime) }
  it { should have_db_column(:deleted_at).of_type(:datetime) }
  it { should have_db_column(:updated_at).of_type(:datetime) }

  context '#from_recommendation' do
    let!(:raw_recommendations) { create(:raw_data_recommendations) }
    let!(:recommendation) { Tinder::Recommendation.new(raw_recommendations.data.sample) }

    subject { described_class.from_recommendation(recommendation) }
    it { should be_a(Person) }
    it { should be_valid }
  end

end
