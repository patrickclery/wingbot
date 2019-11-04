RSpec.describe ProcessRawData, type: :service do
  include_examples 'service object'

  it { expect(subject).to be true }

  # https://relishapp.com/rspec/rspec-mocks/docs/setting-constraints/message-order
  it 'imports data in logical order' do
    allow(Account).to receive(:from_profile).and_return(double('Account'))
    allow(Profile).to receive(:new).and_return(double('Profile'))

    # Import all the people before the matches to those people
    allow(Person).to receive(:new).and_return(double('Person'))

    # Import all the matches & messages
    allow(Match).to receive(:new).and_return(double('Match'))
    allow(Message).to receive(:new).and_return(double('Message'))

    # Create an account & profile
    # expect(ProcessProfiles).to receive(:call).ordered
    expect(Account).to receive(:from_profile).ordered
    expect(Profile).to receive(:from_profile).ordered

    # Import all the people before the matches to those people
    # expect(ProcessRecommendations).to receive(:call)
    expect(Person).to receive(:new).ordered

    # Import all the matches and messages
    # expect(ProcessUpdates).to receive(:call)
    expect(Match).to receive(:new).ordered
    # Match is synonymous with "Conversation" since every message is tied to a match
    expect(Message).to receive(:new).ordered

    described_class.call
  end

  context 'creates new records for each of the items' do
    it { expect { subject }.to change { Account.count }.by(1) }
    it { expect { subject }.to change { Profile.count }.by(1) }
    it { expect { subject }.to change { Match.count }.by(4) }
    it { expect { subject }.to change { Person.count }.by(4) }
    it { expect { subject }.to change { Message.count }.by(4) }
    it { expect { subject }.to change { RawData.where(imported_at: nil).count }.to(0) }
  end

end