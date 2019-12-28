###############################################################################
RSpec.describe SaveProfile, vcr: true do

  # Allow use of the live token
  let(:api_token) { ENV['TINDER_API_TOKEN'] || "12a3bc45-a123-123a-1a23-1234abc4de5f" }

  subject do
    VCR.use_cassette('services/SaveProfile') do
      SaveProfile.call(api_token: api_token)
    end
  end

  it { expect { subject }.to change { Account.count }.by(1) }
  it { expect(subject).to be true }
  it { expect { subject }.to change { RawData.where(imported_at: nil, tag: 'profile').count }.by(1) }

end

###############################################################################
RSpec.describe SaveUpdates do

  # Allow use of the live token
  let(:api_token) { ENV['TINDER_API_TOKEN'] || "12a3bc45-a123-123a-1a23-1234abc4de5f" }

  subject do
    VCR.use_cassette('services/SaveUpdates') do
      SaveUpdates.call(api_token: api_token)
    end
  end

  it { expect { subject }.to change { Account.count }.by(1) }
  it { expect(subject).to be true }
  it { expect { subject }.to change { RawData.where(imported_at: nil, tag: 'updates').count }.by(1) }

end

###############################################################################
RSpec.describe SaveRecommendations do

  let(:api_token) { ENV['TINDER_API_TOKEN'] || "12a3bc45-a123-123a-1a23-1234abc4de5f" }

  subject do
    VCR.use_cassette('services/SaveRecommendations') do
      SaveRecommendations.call(api_token: api_token)
    end
  end

  it { expect { subject }.to change { Account.count }.by(1) }
  it { expect(subject).to be true }
  it { expect { subject }.to change { RawData.where(imported_at: nil, tag: 'recommendations').count }.by(1) }
end


###############################################################################
RSpec.describe SaveAccountData, type: :service do

  let(:api_token) { ENV['TINDER_API_TOKEN'] || "12a3bc45-a123-123a-1a23-1234abc4de5f" }

  subject do
    VCR.use_cassette('services/SaveAccountData') do
      SaveAccountData.call(api_token: api_token)
    end
  end

  it { expect(SaveAccountData).to respond_to(:call).with_keywords(:api_token) }
  it 'imports data in logical order' do
    expect(SaveProfile).to receive(:call).ordered
    expect(SaveRecommendations).to receive(:call).ordered
    expect(SaveUpdates).to receive(:call).ordered

    subject
  end
end
