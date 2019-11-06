class SaveProfile

  # Fetches the latest recommendations and handles errors
  # @raise Exception if the request returns anything except cards/results
  # @return Boolean true
  def self.call(api_token:) # Fetching recommendations...
    client           = Tinder::Client.new
    client.api_token = api_token
    RawData.create(data: client.profile, tag: 'recommendations')
    true
  end

end