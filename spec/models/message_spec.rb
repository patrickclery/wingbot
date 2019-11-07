RSpec.describe Message, type: :model do

  let!(:account) { create(:account, tinder_id: 'AAAAAAAAAAAAAAAAAAAAAAAA') }
  let!(:person) { create(:person, account: account, tinder_id: 'BBBBBBBBBBBBBBBBBBBBBBBB') }
  let!(:raw_updates) { create(:raw_data_updates) }
  let!(:updates) { raw_updates.to_updates }
  let!(:matches) { updates.matches }
  let!(:match) { create(:match, account: account, person: person, tinder_match_id: 'BBBBBBBBBBBBBBBBBBBBBBBBAAAAAAAAAAAAAAAAAAAAAAAA') }

  it { should belong_to(:match).required }
  it { should have_many(:replies).with_foreign_key(:parent_id) }
  it { should belong_to(:message).with_foreign_key(:parent_id).optional }
  it { should have_db_column(:content) }
  it { should have_db_column(:is_outgoing).of_type(:boolean) }
  it { should have_db_column(:tinder_message_id) }

  it { should have_db_column(:created_at).of_type(:datetime) }
  it { should have_db_column(:deleted_at).of_type(:datetime) }
  it { should have_db_column(:sent_at).of_type(:datetime) }

end
