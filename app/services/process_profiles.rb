class ProcessProfiles

  # Fetches the latest profile and handles errors
  # @raise Exception if the request fails
  # @return Boolean true
  class << self

    def call
      RawData.where(imported_at: nil, tag: 'profile').each do |rec|
        CreateAccountFromProfile.call(rec.to_profile)
        rec.mark_as_imported!
      end
      true
    end

  end
end
