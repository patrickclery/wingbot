class SaveRecommendations

  # @return Boolean true
  def self.call(api_token:)
    client           = Tinder::Client.new
    client.api_token = api_token
    profile          = client.profile
    account          = Account.from_profile(profile)

    client.get_recommendations.each do |recommendations|
      RawData.create account: Account.from_profile(profile),
                     data:    recommendations,
                     tag:     'recommendations'

    end
    true
  end
end
