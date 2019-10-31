RSpec.describe Person, type: :model do

  include_context 'raw data'

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

  context '#from_user' do
    subject do
      described_class.from_user(user: recommendation.to_recommendations.user)
    end
    it { should be_a(Person) }
  end

end
