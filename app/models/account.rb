class Account < ApplicationRecord
  has_many :profiles, autosave: true
  has_many :people, autosave: true
  has_many :matches, autosave: true
  has_many :raw_data, autosave: true, class_name: 'RawData'

  # @return Account
  # @param Hash JSON response of from a profile request
  def self.from_profile(profile)
    find_or_initialize_by(tinder_id: profile.user._id).then do |obj|
      obj.assign_attributes is_email_verified: false,
                            is_active:         false,
                            name:              profile.user.name,
                            email:             profile.account.account_email,
                            phone_number:      profile.account.account_phone_number,
                            data:              profile.to_json
      obj
    end
  end
end
