class SaveUpdates

  # @return Boolean true
  def self.call(api_token:)
    client           = Tinder::Client.new
    client.api_token = api_token
    profile          = client.profile
    account          = Account.from_profile(profile)

    RawData.create account: Account.from_profile(profile),
                   data:    client.updates,
                   tag:     'updates'

    true
  end
end
