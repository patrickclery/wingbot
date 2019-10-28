RSpec.describe Match, type: :model do

  include_context 'raw data'

  let!(:updates) do
    gem_dir    = Gem::Specification.find_by_name("tinder_client").gem_dir
    json_parse = JSON.parse(File.read(File.join("#{gem_dir}/spec/tinder/fixtures/updates.json")))
    Tinder::Updates.new(json_parse)
  end
  let!(:match) { updates.matches.sample }

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
    shared_context 'http request stubs'
    subject { described_class.from_match(match: match) }
    it { should be_a(Match) }
  end

end
