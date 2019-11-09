###############################################################################
RSpec.describe SaveProfile do

  include_context 'stubs'

  subject { SaveProfile.call(api_token: api_token) }

  it { expect { subject }.to change { Account.count }.by(1) }
  it { expect(subject).to be true }
  it { expect { subject }.to change { RawData.where(imported_at: nil, tag: 'profile').count }.by(1) }

end

###############################################################################
RSpec.describe SaveUpdates do
  include_context 'stubs'

  subject { SaveUpdates.call(api_token: api_token) }

  it { expect { subject }.to change { Account.count }.by(1) }
  it { expect(subject).to be true }
  it { expect { subject }.to change { RawData.where(imported_at: nil, tag: 'updates').count }.by(1) }

end

###############################################################################
RSpec.describe SaveRecommendations do

  include_context 'stubs'

  subject { SaveRecommendations.call(api_token: api_token) }

  it { expect { subject }.to change { Account.count }.by(1) }
  it { expect(subject).to be true }
  it { expect { subject }.to change { RawData.where(imported_at: nil, tag: 'recommendations').count }.by(4) }
end


###############################################################################
RSpec.describe SaveAccountData, type: :service do
  include_examples 'stubs'
  subject { SaveAccountData.call(api_token: api_token) }

  it { expect(SaveAccountData).to respond_to(:call).with_keywords(:api_token) }
  it 'imports data in logical order' do
    expect(SaveProfile).to receive(:call).ordered
    expect(SaveRecommendations).to receive(:call).ordered
    expect(SaveUpdates).to receive(:call).ordered

    subject
  end
end
