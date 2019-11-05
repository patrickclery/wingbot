RSpec.describe ProcessUpdates, type: :service do
  subject { described_class }
  let!(:person) { create(:person, tinder_id: '5d071adce970261500be5597') }
  let!(:account) { create(:account) }
  let!(:raw_updates) { create(:raw_data_updates) }
  let!(:raw_profile) { create(:raw_data_profile) }
  let!(:raw_updates) { create(:raw_data_updates) }
  let!(:raw_recommendations) { create(:raw_data_recommendations) }

  it { should respond_to(:call).with(1).argument }

  describe '#call' do
    subject { described_class.call(account) }



    it { expect(subject).to be true }
    it { expect { subject }.to change { Match.count }.by(4) }
    it { expect { subject }.to change { Message.count }.by(4) }
    it { expect { subject }.to change { RawData.where(imported_at: nil, tag: 'updates').count }.from(1).to(0) }
  end

end