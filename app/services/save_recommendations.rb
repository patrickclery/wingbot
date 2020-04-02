class SaveRecommendations

  # @return Boolean true
  def self.call(api_token:)
    client           = Tinder::Client.new
    client.api_token = api_token
    profile          = client.profile
    account          = Account.from_profile(profile)

    # Loop through until all recommendations are exhausted
    while (data = client.recommendations) do
      RawData.create account: Account.from_profile(profile),
                     data:    data,
                     tag:     'recommendations'
    end
    true
  end
end
