RSpec.shared_examples 'service object' do
  subject { described_class.call }
  include_context 'default' # From tinder_client
end