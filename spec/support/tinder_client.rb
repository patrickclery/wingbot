# Borrow the shared stubs from the tinder client
gem_dir = Gem::Specification.find_by_name("tinder_client").gem_dir
require "#{gem_dir}/spec/tinder/contexts/http_request_stubs"
