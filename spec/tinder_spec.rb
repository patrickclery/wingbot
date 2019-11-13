RSpec.describe BetterTinder do
  it { should be_a(Module) }

  describe 'Dependencies' do
    it { expect(Gem.loaded_specs.has_key? 'database_cleaner').to be true }
    it { expect(Gem.loaded_specs.has_key? 'debase').to be true }
    it { expect(Gem.loaded_specs.has_key? 'dry-initializer').to be true }
    it { expect(Gem.loaded_specs.has_key? 'dry-struct').to be true }
    it { expect(Gem.loaded_specs.has_key? 'dry-types').to be true }
    it { expect(Gem.loaded_specs.has_key? 'factory_bot').to be true }
    it { expect(Gem.loaded_specs.has_key? 'factory_bot_rails').to be true }
    it { expect(Gem.loaded_specs.has_key? 'faker').to be true }
    it { expect(Gem.loaded_specs.has_key? 'graphiql-rails').to be true }
    it { expect(Gem.loaded_specs.has_key? 'graphql').to be true }
    it { expect(Gem.loaded_specs.has_key? 'jbuilder').to be true }
    it { expect(Gem.loaded_specs.has_key? 'listen').to be true }
    it { expect(Gem.loaded_specs.has_key? 'pg').to be true }
    it { expect(Gem.loaded_specs.has_key? 'puma').to be true }
    it { expect(Gem.loaded_specs.has_key? 'rails').to be true }
    it { expect(Gem.loaded_specs.has_key? 'rspec').to be true }
    it { expect(Gem.loaded_specs.has_key? 'rspec-core').to be true }
    it { expect(Gem.loaded_specs.has_key? 'rspec-graphql_matchers').to be true }
    it { expect(Gem.loaded_specs.has_key? 'rspec-rails').to be true }
    it { expect(Gem.loaded_specs.has_key? 'rubocop').to be true }
    it { expect(Gem.loaded_specs.has_key? 'rubocop-rspec').to be true }
    it { expect(Gem.loaded_specs.has_key? 'ruby-debug-ide').to be true }
    it { expect(Gem.loaded_specs.has_key? 'shoulda-matchers').to be true }
    it { expect(Gem.loaded_specs.has_key? 'simplecov').to be true }
    it { expect(Gem.loaded_specs.has_key? 'spring-watcher-listen').to be true }
    it { expect(Gem.loaded_specs.has_key? 'sprockets-rails').to be true }
    it { expect(Gem.loaded_specs.has_key? 'tinder_client').to be true }
    it { expect(Gem.loaded_specs.has_key? 'vcr').to be true }
    it { expect(Gem.loaded_specs.has_key? 'web-console').to be true }
    it { expect(Gem.loaded_specs.has_key? 'webmock').to be true }
    it { expect(Gem.loaded_specs.has_key? 'webpacker').to be true }
  end
end
