RSpec.describe SaveRecommendations do
  include_context 'http request stubs'
  subject { described_class }

  let(:api_token) { "eyJhbGciOiJIUzI1NiJ9.MTc3ODk5MDk4MDM.5q4R0H08rE0Dd9KgxMPp6jcTfIBLCXgEuVZfC9znJTE" }

  # Returns all the results at once
  before do
    # Stub http requests
  end

  it { should respond_to(:call).with_keywords(:api_token) }

  it 'can save raw JSON data' do
    result = subject.call(api_token: api_token)
    expect(result).to be true
  end

end
