### All the Save* services use this same pattern of tests
RSpec.shared_context 'save data' do
  include_context 'stubs'

  let(:api_token) { "eyJhbGciOiJIUzI1NiJ9.MTc3ODk5MDk4MDM.5q4R0H08rE0Dd9KgxMPp6jcTfIBLCXgEuVZfC9znJTE" }
  let!(:raw_profile) { create(:raw_data_profile) }
  let!(:raw_recommendations) { create(:raw_data_recommendations) }
  let!(:raw_updates) { create(:raw_data_updates) }

  subject { described_class.call(api_token: api_token) }
  it { should be true }
  it { expect(described_class).to respond_to(:call).with_keywords(:api_token) }
  it { expect { subject }.to change { RawData.where(imported_at: nil) } }
end

###############################################################################
RSpec.describe SaveRawData, type: :service do
  include_examples 'save data'

  it 'imports data in logical order' do
    # Stubs real work - we only care about order
    allow(SaveProfile).to receive(:call).with(api_token: api_token).and_return(true)
    allow(SaveRecommendations).to receive(:call).with(api_token: api_token).and_return(true)
    allow(SaveUpdates).to receive(:call).with(api_token: api_token).and_return(true)

    expect(SaveProfile).to receive(:call).ordered
    expect(SaveRecommendations).to receive(:call).ordered
    expect(SaveUpdates).to receive(:call).ordered

    subject
  end
end

###############################################################################
RSpec.describe(SaveProfile) { include_examples 'save data' }
RSpec.describe(SaveRecommendations) { include_examples 'save data' }
RSpec.describe(SaveUpdates) { include_examples 'save data' }
