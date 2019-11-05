class CreateAccountFromProfile

  # @return Account
  # @param Hash JSON response of from a profile request
  def self.call(profile)
    Account.find_or_initialize_by(tinder_id: profile.user._id).then do |account|
      account.assign_attributes is_email_verified: false,
                                is_active:         false,
                                name:              profile.user.name,
                                email:             profile.account.account_email,
                                phone_number:      profile.account.account_phone_number,
                                data:              profile.to_json
      account.save
      account
    end
  end
end