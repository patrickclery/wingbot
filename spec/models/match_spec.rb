RSpec.describe Match, type: :model do

  include_context 'raw data'

  it { should have_attribute(:common_friend_count) }
  it { should have_attribute(:common_like_count) }
  it { should have_attribute(:is_boost_match) }
  it { should have_attribute(:is_closed) }
  it { should have_attribute(:is_dead) }
  it { should have_attribute(:is_fast_match) }
  it { should have_attribute(:is_following) }
  it { should have_attribute(:is_following_moments) }
  it { should have_attribute(:is_muted) }
  it { should have_attribute(:is_pending) }
  it { should have_attribute(:is_super_like) }
  it { should have_attribute(:last_active_at) }
  it { should have_attribute(:matched_at) }
  it { should have_attribute(:participants) }
  it { should have_attribute(:person_id) }
  it { should have_attribute(:readreceipt) }
  it { should have_attribute(:seen) }
  it { should have_attribute(:tinder_match_id) }

  context '#from_match' do
    subject { described_class.from_match(match: match) }
    it { should be_a(Match) }
  end
  context '#from_updates' do
    subject { described_class.from_updates(updates: updates) }
    it { should be_an(Array) }
  end

end
