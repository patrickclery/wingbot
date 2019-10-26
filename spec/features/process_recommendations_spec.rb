RSpec.describe ProcessRawData, type: :feature do

  it { should respond_to(:call) }

  it 'processes unimported raw data' do
    expect { subject.call(api_token: api_token) }.to change { RawData.where(imported_at: nil).count }.from(3).to(0)
  end

  it 'returns true on success' do
    expect(subject.call(api_token: api_token)).to be true
  end
end