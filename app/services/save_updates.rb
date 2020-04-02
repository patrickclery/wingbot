class SaveUpdates

  # @return Boolean true
  def self.call(api_token:)
    client           = Tinder::Client.new
    client.api_token = api_token
    account          = Account.from_profile(client.profile)

    # For now, always grab ALL updates (since 2015)
    updates = client.updates(since: Time.new('2015'))

    RawData.create account: account,
                   data:    updates,
                   tag:     'updates'
    true
  end
end
