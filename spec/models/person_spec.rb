RSpec.describe Person, type: :model do

  let!(:raw_datas) { create_list(:raw_data_recommendation, 3) }
  let!(:recommendation) { raw_datas.sample }

  it { should have_attribute(:birthdate) }
  it { should have_attribute(:tinder_id) }
  it { should have_attribute(:bio) }
  it { should have_attribute(:name) }
  it { should have_attribute(:photos) }
  it { should have_attribute(:gender) }
  it { should have_attribute(:schools) }
  it { should have_attribute(:name) }
  it { should have_attribute(:is_traveling) }
  it { should have_attribute(:hide_age) }
  it { should have_attribute(:hide_distance) }

  context '#from_recommendation' do
    subject do
      described_class.from_recommendation(recommendation: recommendation.to_recommendation)
    end
    it { should be_a(Person) }
  end

end
