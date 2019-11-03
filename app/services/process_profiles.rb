class ProcessProfiles

  # Fetches the latest profile and handles errors
  # @raise Exception if the request fails
  # @return Boolean true
  class << self

    def call
      RawData.where(imported_at: nil, tag: 'profile').each do |rec|
        Tinder::ActiveProfile.new(rec.data).then do |profile|
          # Create an account
          Account.from_profile(profile: profile).then do |account|
            account.save!
            Profile.from_profile(profile: profile).then do |profile|
              profile.account = account
              profile.save!
            end
          end
        end
      end
      true
    end

  end
end
