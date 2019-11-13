RSpec.describe VCR do
  it { expect(Gem.loaded_specs.has_key? 'vcr').to be true }
end