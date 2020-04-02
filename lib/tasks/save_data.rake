#!/usr/bin/env ruby

# ### Environment Variables
# `phone_number` - the phone number to login with
# `tinder_token_path` - where to store access_token.txt

require 'bundler/setup'
require 'rake'

def api_token
  IO.read(token_path).chomp
end

def token_path
  default_dir = File.join(Rails.root, '/tmp')
  "#{ENV['tinder_token_path'] || default_dir}/tinder_access_token.txt"
end

namespace :tinder do

  desc 'Save profile'
  task :save_profile do
    require File.expand_path('../../../config/environment', __FILE__)
    SaveProfile.call(api_token: api_token)
  end

  desc 'Save recommendations'
  task :save_recommendations do
    require File.expand_path('../../../config/environment', __FILE__)
    SaveRecommendations.call(api_token: api_token)
  end

  desc 'Save updates'
  task :save_updates do
    require File.expand_path('../../../config/environment', __FILE__)
    SaveUpdates.call(api_token: api_token)
  end

end