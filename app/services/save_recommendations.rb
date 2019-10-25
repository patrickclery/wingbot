require 'tinder/client'

class SaveRecommendations

  # Fetches the latest recommendations and handles errors
  # @raise Exception if the request returns anything except cards/results
  # @return Boolean true
  class << self

    def call(api_token:) # Fetching recommendations...
      client           = Tinder::Client.new
      client.api_token = api_token
      client.get_recommended_users.each do |card| # Then loop through each card within the collection
        RawData.create(data: card.to_json, tag: 'recommended_users')
      end
      true
    rescue StandardError => e
      fail "Failed to save recommended users: #{e.message}"
    end

  end
end
