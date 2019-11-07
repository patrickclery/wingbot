class SaveRawData
  # Fetches the latest recommendations and handles errors
  # @raise Exception if the request returns anything except cards/results
  # @return Boolean true
  def self.call(tag:, api_token:)
    raise unless %i{ updates profile recommendations }.include?(tag)

    client           = Tinder::Client.new
    client.api_token = api_token
    profile = client.profile
    # It's possible to get the account by doing 2 requests, but it's most likely that in the calling context, we already have `account`, so it's added as a parameter
    RawData.create account: Account.from_profile(profile),
                   data: client.send(tag),
                   tag: tag
    true
  end

end
