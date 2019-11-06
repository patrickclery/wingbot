RSpec.describe SaveProfile, type: :service do
  # Borrow the http request stubs from tinder_client gem.
  include_context 'stubs'
  subject { described_class }
  let(:api_token) { "eyJhbGciOiJIUzI1NiJ9.MTc3ODk5MDk4MDM.5q4R0H08rE0Dd9KgxMPp6jcTfIBLCXgEuVZfC9znJTE" }

  it { should respond_to(:call).with_keywords(:api_token) }

  describe '#call', type: :method do
    subject { described_class.call(api_token: api_token) }
    it { expect(subject).to be true }
    it { expect { subject }.to change { RawData.where(tag: 'profile').count }.by(1) }
  end
end