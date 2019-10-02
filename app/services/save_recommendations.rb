class SaveRecommendations

  # Fetches the latest recommendations and handles errors
  # @raise Exception if the request returns anything except cards/results
  # @return Array of all the cards^
  class << self

    def call(api_token:)
      # Fetching recommendations...
      client(api_token: api_token).get_recommended_users.each do |card|
        # Then loop through each card within the collection
        RawData.create(data: card.to_json, tag: 'get_recommended_users')
      end
      true
    rescue StandardError => e
      puts "An error was raised: #{e.message}"
    end

    private

    def client(api_token:)
      Tinder::Client.new.tap do |c|
        c.api_token = api_token
      end
    end

  end
end
