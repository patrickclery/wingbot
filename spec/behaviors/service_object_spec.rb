RSpec.shared_examples 'service object' do
  subject { described_class.call }
  include_context 'raw data'
  include_context 'default'
end