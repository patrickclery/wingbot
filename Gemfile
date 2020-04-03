# frozen_string_literal: true

source "https://rubygems.org"

ruby "2.6.5"

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

gem 'dry-initializer', git: 'https://github.com/dry-rb/dry-initializer.git'
gem 'dry-struct', git: 'https://github.com/dry-rb/dry-struct.git'
gem 'dry-types', git: 'https://github.com/dry-rb/dry-types.git'
gem 'tinder_client', '~> 0.1.5', git: 'https://github.com/patrickclery/tinder_client.git'
gem 'graphql', git: 'https://github.com/rmosolgo/graphql-ruby'
gem 'graphiql-rails'

group :test do
  gem 'database_cleaner'
  gem 'rspec', '~> 3.8'
  gem 'rspec-core', '~> 3.8'
  gem 'rspec-rails', '~> 3.8'
  gem 'rubocop'
  gem 'rubocop-rspec'
  gem 'shoulda-matchers'
  gem 'webmock'
  gem 'rspec-graphql_matchers', git: 'https://github.com/khamusa/rspec-graphql_matchers', ref: '6633aa7'
  gem 'factory_bot'
  gem 'factory_bot_rails'
  gem 'faker'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test, :development do
  # For RubyMine debugger
  gem 'ruby-debug-ide'
  gem 'debase'
  gem 'simplecov'
  gem 'codecov'
end

