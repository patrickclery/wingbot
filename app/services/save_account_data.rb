class SaveAccountData

  # @return Boolean true
  def self.call(api_token:)
    ActiveRecord::Base.transaction do
      SaveProfile.call         api_token: api_token
      SaveRecommendations.call api_token: api_token
      SaveUpdates.call         api_token: api_token
    end
    true
  end

end
