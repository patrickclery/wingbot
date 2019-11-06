require 'tinder/client'

class SaveRecommendations

  # Fetches the latest recommendations and handles errors
  # @raise Exception if the request returns anything except cards/results
  # @return Boolean true
  class << self

    def call(api_token:) # Fetching recommendations...
      client           = Tinder::Client.new
      client.api_token = api_token
      RawData.create(data: client.get_recommendations, tag: 'recommendations')
      true
    end

  end
end
