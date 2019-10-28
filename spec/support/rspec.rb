require 'rspec/rails'
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

# Shared contexts
Dir['./spec/contexts/**.rb'].each do |f|
  require f.sub(%r|\./spec/|, '')
end