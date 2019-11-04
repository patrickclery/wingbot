class CreateProfileFromProfile

  # @return Profile
  # @param Hash JSON response of from a profile request
  def self.call(data)
    profile = Tinder::ActiveProfile.new(data)
    Account.find_or_initialize_by(tinder_id: profile.user._id).then do |account|
      account.assign_attributes is_email_verified: false,
                                is_active:         false,
                                name:              profile.user.name,
                                email:             profile.account.account_email,
                                phone_number:      profile.account.account_phone_number,
                                data:              data
      account.save
      account
    end
  end
end