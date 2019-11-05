RSpec.describe ProcessRecommendations, type: :service do

  subject { described_class }
  let!(:account) { create(:account) }
  let!(:raw_recommendations) { create(:raw_data_recommendations) }

  it { should respond_to(:call) }
  describe '#call' do
    subject { described_class.call }
    it { expect { subject }.to change { Person.count }.by(4) }
    it { expect { subject }.to change { RawData.where(imported_at: nil, tag: 'recommendations').count }.from(1).to(0) }
    it { expect(subject).to be true }
  end

end
