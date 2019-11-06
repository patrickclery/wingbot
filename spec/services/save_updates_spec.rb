RSpec.describe SaveUpdates do
  include_context 'stubs'
  # Borrow the http request stubs from tinder_client gem.
  let(:api_token) { "eyJhbGciOiJIUzI1NiJ9.MTc3ODk5MDk4MDM.5q4R0H08rE0Dd9KgxMPp6jcTfIBLCXgEuVZfC9znJTE" }

  describe '#call', type: :method do
    subject { SaveUpdates.call(api_token: api_token) }
    it { expect(SaveUpdates).to respond_to(:call).with_keywords(:api_token) }
    it { expect { subject }.to change { RawData.where(tag: 'updates').count }.by(1) }
    it { should be true }
  end
end