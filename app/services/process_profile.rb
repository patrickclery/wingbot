class ProcessProfile

  # Fetches the latest profile and handles errors
  # @raise Exception if the request fails
  # @return Boolean true
  class << self

    def call
      RawData.where(imported_at: nil, tag: 'profile').each do |rec|
        profile           = rec.to_profile
        tinder_account_id = profile.user._id
        account           = Account.find_or_initialize_by(tinder_id: tinder_account_id)
        account.assign_attributes is_email_verified: false,
                                  is_active:         false,
                                  name:              profile.user.name,
                                  email:             profile.account.account_email,
                                  phone_number:      profile.account.account_phone_number,
                                  data:              profile.to_json
        account.save
        rec.mark_as_imported!
        account
      end
      true
    end

  end

end
