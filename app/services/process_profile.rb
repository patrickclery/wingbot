class ProcessProfile

  # @return Boolean true
  def self.call
    RawData.where(imported_at: nil, tag: 'profile').each do |rec|
      profile_struct = rec.to_profile
      Account.from_profile(profile_struct).then do |account|
        Profile.from_profile(profile_struct).then do |profile|
          profile.account = account
          profile.save!
        end
        account.save!
      end
      rec.mark_as_imported!
    end
    true
  end

end
