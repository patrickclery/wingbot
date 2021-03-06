RSpec.describe Match, type: :model do

  let!(:account)     { create(:account, tinder_id: 'AAAAAAAAAAAAAAAAAAAAAAAA') }
  let!(:person)      { create(:person, account: account, tinder_id: 'BBBBBBBBBBBBBBBBBBBBBBBB') }
  let!(:raw_updates) { create(:raw_data_updates) }
  let!(:updates)     { raw_updates.to_updates }
  let!(:matches)     { updates.matches }
  let!(:match) do
    obj = updates.matches.sample
    allow(obj).to receive(:_id).and_return('BBBBBBBBBBBBBBBBBBBBBBBBAAAAAAAAAAAAAAAAAAAAAAAA')
    obj
  end

  # Schema
  it { should belong_to(:person).required.autosave(true) }
  it { should have_one(:account).through(:person) }
  it { should have_db_column(:common_friend_count) .of_type(:integer) }
  it { should have_db_column(:common_like_count)   .of_type(:integer) }
  it { should have_db_column(:is_boost_match)      .of_type(:boolean) }
  it { should have_db_column(:is_closed)           .of_type(:boolean) }
  it { should have_db_column(:is_dead)             .of_type(:boolean) }
  it { should have_db_column(:is_fast_match)       .of_type(:boolean) }
  it { should have_db_column(:is_following)        .of_type(:boolean) }
  it { should have_db_column(:is_following_moments).of_type(:boolean) }
  it { should have_db_column(:is_muted)            .of_type(:boolean) }
  it { should have_db_column(:is_pending)          .of_type(:boolean) }
  it { should have_db_column(:is_super_like)       .of_type(:boolean) }
  it { should have_db_column(:last_active_at)      .of_type(:datetime) }
  it { should have_db_column(:matched_at)          .of_type(:datetime) }
  it { should have_db_column(:participants)        .of_type(:integer).with_options(array: true) }
  it { should have_db_column(:person_id)           .of_type(:integer) }
  it { should have_db_column(:readreceipt)         .of_type(:integer).with_options(array: true) }
  it { should have_db_column(:seen)                .of_type(:integer).with_options(array: true) }
  it { should have_db_column(:tinder_match_id)     .of_type(:string).with_options(required: true) }
  # Timestamps
  it { should have_db_column(:created_at)  .of_type(:datetime) }
  it { should have_db_column(:unmatched_at).of_type(:datetime) }
  it { should have_db_column(:deleted_at)  .of_type(:datetime) }
  it { should have_db_column(:updated_at)  .of_type(:datetime) }

  describe '#from_match', type: :method do
    subject { described_class.from_match(match) }
    it { should be_a(Match) }
  end
  describe '#from_updates', type: :method do
    subject { described_class.from_updates(updates) }
    it { should be_an(Array) }
  end

end
