RSpec.describe CreateMatchFromData, type: :service do
  subject { described_class }

  let!(:account) { create(:account, tinder_id: 'AAAAAAAAAAAAAAAAAAAAAAAA') }
  let!(:person) { create(:person, tinder_id:   'BBBBBBBBBBBBBBBBBBBBBBBB') }
  let!(:raw_updates) { create(:raw_data_updates) }
  let!(:updates) { raw_updates.to_updates }
  let!(:matches) { updates.matches }
  # Stubs a match that associates account & person
  let!(:match) { updates.matches.sample }

  it { should respond_to(:call).with_keywords(:match, :account) }
  describe '#call' do
    subject(:valid_match) { described_class.call(match: match, account: account) }
    it { expect(subject).to be_a(Match) }
    it { expect { subject }.to change { Match.count }.by(1) }
  end
end