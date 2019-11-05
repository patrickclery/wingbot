require 'tinder/client'

class SaveUpdates

  # Fetches the latest updates and handles errors
  # @raise Exception if the request fails
  # @return Boolean true
  class << self

    def call(api_token:) # Fetching updates...
      client           = Tinder::Client.new
      client.api_token = api_token
      RawData.create(data: client.get_updates, tag: 'updates')
      true
    end

  end
end
