RSpec.describe Message, type: :model do

  let!(:account) { create(:account) }
  let!(:person) { create(:person, tinder_id: '89038190283xjfklsdjklfjs') }
  let!(:raw_updates) { create(:raw_data_updates) }
  let!(:updates) { raw_updates.to_updates }
  let!(:matches) { updates.matches }
  let!(:match) do
    obj = updates.matches.sample
    allow(obj).to receive(:_id).and_return('89038190283xjfklsdjklfjs89038190283xjfklsdjklfjs')
    obj
  end

  let(:message) { updates.matches.select{|match| match.messages.count.positive? }.sample.messages.first }

  it { should belong_to(:match) }
  it { should have_db_column(:content) }
  it { should have_db_column(:created_at) }
  it { should have_db_column(:deleted_at) }
  it { should have_db_column(:from_id).of_type(:integer) }
  it { should have_db_column(:reply_id) }
  it { should have_db_column(:sent_at) }
  it { should have_db_column(:tinder_message_id) }
  it { should have_db_column(:tinder_timestamp) }
  it { should have_db_column(:tinder_timestamp) }
  it { should have_db_column(:to_id) }
  it { should have_db_column(:updated_at) }

  context '#from_message' do
    subject { described_class.from_message(message: message) }
    it { should be_a(Message) }
  end

end
