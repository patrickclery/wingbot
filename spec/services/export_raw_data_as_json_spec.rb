#############################################################################
RSpec.describe ExportRawData do

  around(:each) do |example|
    # Freeze time since the filename is uses current time
    travel_to Time.new(2019, 1, 2, 3, 4) do
      # Cleanup the old export
      File.delete(filepath) if File.exists?(filepath)
      example.run
      File.delete(filepath) if File.exists?(filepath)
    end
  end

  ### All the Process* services use this same pattern of test
  subject                    { described_class.call }
  let!(:account)             { create(:account) }
  let!(:raw_profile)         { create(:raw_data_profile,         account: account) }
  let!(:raw_recommendations) { create(:raw_data_recommendations, account: account) }
  let!(:raw_updates)         { create(:raw_data_updates,         account: account) }
  let!(:filepath)            { File.join(::Rails.root, "/tmp/tinder_export-2019-01-02.json") }

  it { expect(described_class).to respond_to(:call) }

  ###########################################################################
  context "Pretend the file write worked" do

    before do
      # Setup a file descriptor that when given puts does nothing
      fd = double(File)

      allow(fd)  .to receive(:puts).and_return(true)
      allow(File).to receive(:open).and_yield(fd)
    end

    it { should eq filepath  }
  end

  ###########################################################################
  # Responds to an ENV

  ###########################################################################
  # Delegations
  it 'calls raw data', pending: true do
    expect(RawData).to receive(:all)
    subject
  end
  it { expect(File).to receive(:open); subject }

  context "exports all data in JSON format to the temp directory" do
    it { expect { subject }.to change { File.exists?(filepath) }.to(true) }
  end
end