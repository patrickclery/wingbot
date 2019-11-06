RSpec.describe CreateMatchFromData, type: :service do
  subject { described_class }

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

  it { should respond_to(:call).with_keywords(:match, :person, :account) }
  describe '#call' do
    subject(:valid_match) { described_class.call(match: match, person: person, account: account) }
    it { expect(subject).to be_a(Match) }
    it { expect { subject }.to change { Match.count }.by(1) }
  end
end