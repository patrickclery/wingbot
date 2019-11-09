class SaveRawData

  # @raise Exception if it's an invalid tag
  # @return Boolean true
  def self.call(tag:, api_token:)
    raise unless %i{ updates profile }.include?(tag.to_sym)

    client           = Tinder::Client.new
    client.api_token = api_token
    # It's possible to get the account by doing 2 requests, but it's most likely that in the calling context, we already have `account`, so it's added as a parameter
    profile = client.profile

    RawData.create account: Account.from_profile(profile),
                   data: client.send(tag),
                   tag: tag
    true
  end

end
