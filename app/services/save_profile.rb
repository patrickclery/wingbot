class SaveProfile

  # Fetches the active account/profile
  # @param String The API token provided by Tinder when logged in
  # @return Boolean true
  def self.call(api_token:) # Fetching recommendations...
    client           = Tinder::Client.new
    client.api_token = api_token

    profile = client.profile
    RawData.create account: Account.from_profile(profile),
                   data: client.profile,
                   tag: 'profile'
    true
  end

end