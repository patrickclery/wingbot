class SaveRawData

  # @return Boolean true
  def self.call(api_token:)
    SaveProfile.call(api_token: api_token)
    SaveRecommendations.call(api_token: api_token)
    SaveUpdates.call(api_token: api_token)
    true
  end

end
