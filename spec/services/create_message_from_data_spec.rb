RSpec.describe CreateMessageFromData, type: :service do
  subject { described_class }

  let!(:account) { create(:account, tinder_id: 'AAAAAAAAAAAAAAAAAAAAAAAA') }
  let!(:person) { create(:person, tinder_id:   'BBBBBBBBBBBBBBBBBBBBBBBB') }
  let!(:raw_updates) { create(:raw_data_updates) }
  let!(:updates) { raw_updates.to_updates }
  let!(:messages) { updates.inbox }
  let!(:message) { messages.sample }

  it { should respond_to(:call).with(1).argument }
  describe '#call' do
    subject(:valid_match) { described_class.call(match: match, account: account) }
    it { expect(subject).to be_a(Match) }
    it { expect { subject }.to change { Match.count }.by(1) }
  end


    # When it searches for a message, just return one
    it { should be_a(Message) }
    it { expect(subject.match).to be_present }
  end
end