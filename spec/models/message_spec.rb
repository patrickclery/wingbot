RSpec.describe Message, type: :model do

  include_context 'raw data'

  let(:message) { updates.matches.select{|match| match.messages.count.positive? }.sample.messages.first }

  it { should have_attribute(:content) }
  it { should have_attribute(:created_at) }
  it { should have_attribute(:deleted_at) }
  it { should have_attribute(:from_id) }
  it { should have_attribute(:reply_id) }
  it { should have_attribute(:sent_at) }
  it { should have_attribute(:tinder_match_id) }
  it { should have_attribute(:tinder_message_id) }
  it { should have_attribute(:tinder_timestamp) }
  it { should have_attribute(:to_id) }
  it { should have_attribute(:updated_at) }

  context '#from_message' do
    subject { described_class.from_message(message: message) }
    it { should be_a(Message) }
  end

end
