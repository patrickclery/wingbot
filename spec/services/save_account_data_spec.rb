###############################################################################
RSpec.describe SaveRawData do
  include_context 'stubs'
  let(:api_token) { "12a3bc45-a123-123a-1a23-1234abc4de5f" }

  it { expect(SaveRawData).to respond_to(:call).with_keywords(:tag, :api_token) }

  context 'updates' do
    subject { SaveRawData.call(tag: :updates, api_token: api_token) }
    it { expect { subject }.to change { Account.count }.by(1) }
    it { expect(subject).to be true }
    it { expect { subject }.to change { RawData.where(imported_at: nil, tag: 'updates') } }
  end
  context 'profile' do
    subject { SaveRawData.call(tag: :profile, api_token: api_token) }
    it { expect { subject }.to change { Account.count }.by(1) }
    it { expect(subject).to be true }
    it { expect { subject }.to change { RawData.where(imported_at: nil, tag: 'profile') } }
  end
end

###############################################################################
RSpec.describe SaveRecommendations do
  include_context 'stubs'
  let(:api_token) { "12a3bc45-a123-123a-1a23-1234abc4de5f" }

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
    expect(SaveRawData).to receive(:call).ordered
    expect(SaveRawData).to receive(:call).ordered
    expect(SaveRawData).to receive(:call).ordered

    subject
  end
end
