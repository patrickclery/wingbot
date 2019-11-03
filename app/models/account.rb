class Account < ApplicationRecord
  has_many :profiles

  # @return Account
  # @param Tinder::ActiveProfile Builds an Account from a Tinder::ActiveProfile struct
  def self.from_profile(profile)
    account = find_or_initialize_by(tinder_id: profile.user._id)
    account.assign_attributes is_email_verified: false,
                              is_active:         false,
                              name:              account.name,
                              email:             account.email
    account
  end

end
