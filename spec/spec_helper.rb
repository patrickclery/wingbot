# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)

### Support for CodeCov
SimpleCov.start
SimpleCov.formatter = SimpleCov::Formatter::Codecov

# Prevent database truncation if the environment is production
require 'rspec/rails'

###############################################################################
### General
RSpec.configure do |config|
  config.order        = :random
  config.fixture_path = "#{Rails.root}/spec/fixtures"
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!

  config.include ActiveSupport::Testing::TimeHelpers

  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

###############################################################################
### Shoulda::Matchers
require 'shoulda/matchers'

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

###############################################################################
### FactoryBot

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end

###############################################################################
### DatabaseCleaner
RSpec.configure do |config|

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end

  ###############################################################################
  # set `:type` for services (Service Objects) directory
  config.define_derived_metadata(file_path: Regexp.new('/spec/services/')) do |metadata|
    metadata[:type] = :service
  end

end

# Borrow the shared stubs from the tinder client
gem_dir = Gem::Specification.find_by_name("tinder_client").gem_dir
require "#{gem_dir}/spec/tinder/contexts/http_request_stubs"



