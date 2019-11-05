RSpec.describe ProcessUpdates, type: :service do
  subject { described_class }

  let!(:account) { create(:account) }
  let!(:raw_updates) { create(:raw_data_updates) }
  let!(:raw_profile) { create(:raw_data_profile) }
  let!(:raw_updates) { create(:raw_data_updates) }
  let!(:raw_recommendations) { create(:raw_data_recommendations) }

  it { should respond_to(:call) }


  describe '#call' do
    subject { described_class.call }
    it { expect(subject).to be true }
    it { expect { subject }.to change { Match.count }.by(4) }
    it { expect { subject }.to change { Message.count }.by(4) }
    it { expect { subject }.to change { RawData.where(imported_at: nil, tag: 'updates').count }.from(1).to(0) }
  end

end