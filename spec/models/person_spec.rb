RSpec.describe Person, type: :model do

  let!(:raw_datas) { create_list(:raw_data, 3) }
  let!(:raw_data) { raw_datas.first }

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
    subject { described_class.from_recommendation(recommendation: raw_data.to_recommendation) }
    it { should be_a(Person) }

  end

end
