RSpec.describe Message, type: :model do

  let!(:account) { create(:account, tinder_id: '') }
  let!(:person) { create(:person, tinder_id: '89038190283xjfklsdjklfjs') }
  let!(:raw_updates) { create(:raw_data_updates) }
  let!(:updates) { raw_updates.to_updates }
  let!(:matches) { updates.matches }
  let!(:match) { create(:match, account: account, person: person, tinder_match_id: '89038190283xjfklsdjklfjs89038190283xjfklsdjklfjs') }


  it { should belong_to(:match).required }
  it { should have_many(:replies).with_foreign_key(:parent_id) }
  it { should belong_to(:original).with_foreign_key(:parent_id).optional }
  it { should have_db_column(:content) }
  it { should have_db_column(:is_outgoing).of_type(:boolean) }
  it { should have_db_column(:tinder_message_id) }

  it { should have_db_column(:created_at).of_type(:datetime) }
  it { should have_db_column(:deleted_at).of_type(:datetime) }
  it { should have_db_column(:sent_at).of_type(:datetime) }

  context '#from_message' do
    subject { described_class.from_message(message) }
    # Associate the message to an existing match
    let!(:message) do
      m = updates.matches.select { |match| match.messages.count.positive? }.sample.messages.first
      allow(m).to receive(:match_id).and_return(match.tinder_match_id)
      m
    end

    # When it searches for a message, just return one
    it { should be_a(Message) }
    it { expect(subject.match).to be_present }
  end

end
