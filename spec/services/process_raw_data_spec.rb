RSpec.describe 'ProcessRawData', type: :feature do
  include_context 'default'

  it 'processes unimported raw data' do
    pending
    expect { subject.call(api_token: api_token) }.to change { RawData.where(imported_at: nil).count }.from(3).to(0)
  end

  it 'returns true on success' do
    pending
    expect(subject.call(api_token: api_token)).to be true
  end
end