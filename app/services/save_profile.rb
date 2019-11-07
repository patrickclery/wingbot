class SaveProfile

  # Fetches the active account/profile
  # @param String The API token provided by Tinder when logged in
  # @return Boolean true
  def self.call(api_token:) # Fetching recommendations...
    SaveRawData.call(tag: :profile, api_token: api_token)
  end

end