# frozen_string_literal: true

source "https://rubygems.org"

ruby "2.6.5"

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap"
gem "brakeman"
gem "fast_jsonapi"
gem "json", "~> 2.3.0"
gem "pg"
gem "puma"
gem "rails", "~> 6.0.2.2"
gem "react-rails"
gem "turbolinks"
gem "webpacker", "~> 5.x"
gem 'dry-initializer', git: 'https://github.com/dry-rb/dry-initializer.git'
gem 'dry-struct', git: 'https://github.com/dry-rb/dry-struct.git', ref: 'fe507e6'
gem 'dry-types', git: 'https://github.com/dry-rb/dry-types.git', ref: '3d54d08'
gem 'graphiql-rails'
gem 'graphql', git: 'https://github.com/rmosolgo/graphql-ruby'
gem 'tinder_client', '~> 0.1.6', git: 'https://github.com/patrickclery/tinder_client.git'

group :development do
  gem "better_errors"
  gem "binding_of_caller"
  gem "listen"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "capybara-screenshot"
  gem "codecov"
  gem "database_cleaner"
  gem "factory_bot"
  gem "factory_bot_rails"
  gem "faker"
  gem "rspec"
  gem "rspec-core"
  gem 'rspec-graphql_matchers', git: 'https://github.com/khamusa/rspec-graphql_matchers', ref: '6633aa7'
  gem "rspec-rails", "~> 4.0.0" # Needed for react-rails controller tests
  gem "rails-controller-testing"
  gem "rubocop"
  gem "rubocop-rspec"
  gem "selenium-webdriver"
  gem "shoulda"
  gem "simplecov"
  gem "vcr"
  gem "webdrivers"
  gem "webmock"
end
