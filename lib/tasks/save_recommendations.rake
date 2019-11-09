#!/usr/bin/env ruby

# ### Environment Variables
# `phone_number` - the phone number to login with
# `tinder_token_path` - where to store access_token.txt

gem_dir = Gem::Specification.find_by_name("tinder_client").gem_dir
load "#{gem_dir}/lib/tasks/tinder.rake"

namespace :tinder do

  desc 'Save recommendations'
  task :save_recommendations do
    require File.expand_path('../../../config/environment', __FILE__)
    api_token = IO.read(token_path).chomp
    SaveRawData.call(tag: 'recommendations', api_token: api_token)
  end

end