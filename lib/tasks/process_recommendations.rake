#!/usr/bin/env ruby

# ### Environment Variables
# `phone_number` - the phone number to login with
# `tinder_token_path` - where to store access_token.txt

namespace :tinder do

  desc 'Process recommendations'
  task :process_recommendations do
    require File.expand_path('../../../config/environment', __FILE__)
    ProcessRecommendations.call
  end

end