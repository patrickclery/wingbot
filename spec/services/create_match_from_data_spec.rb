RSpec.describe CreateMatchFromData, type: :service do
  subject { described_class }

  let!(:account) { create(:account, tinder_id: 'AAAAAAAAAAA1111111111AAAA') }
  let!(:person) { create(:person, tinder_id:   'BBBBBBBBBBB2222222222AAAA') }
  let!(:raw_updates) { create(:raw_data_updates) }
  let!(:updates) { raw_updates.to_updates }
  let!(:matches) { updates.matches }
  # Stubs a match that associates account & person
  let!(:match) do
    obj = updates.matches.sample
    allow(obj).to receive(:_id).and_return('AAAAAAAAAAA1111111111AAAABBBBBBBBBBB2222222222AAAA')
    obj
  end

  it { should respond_to(:call).with_keywords(:match, :account) }
  describe '#call' do
    subject(:valid_match) { described_class.call(match: match, account: account) }
    it { expect(subject).to be_a(Match) }
    it { expect { subject }.to change { Match.count }.by(1) }
  end
end