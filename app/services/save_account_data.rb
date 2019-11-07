class SaveAccountData

  # @return Boolean true
  def self.call(api_token:)
    SaveRawData.call(api_token: api_token, tag: :profile)
    SaveRawData.call(api_token: api_token, tag: :recommendations)
    SaveRawData.call(api_token: api_token, tag: :updates)
    true
  end

end
