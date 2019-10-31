class Account < ApplicationRecord
  has_many :profiles

  # @param Tinder::ActiveProfile
  def self.from_profile(profile:)
    find_or_initialize_by(tinder_id: profile.user._id).then do |account|
      account.assign_attributes is_email_verified: false,
                                is_active:         false,
                                name:              account.name,
                                email:             account.email
      account.save!
      account
    end
  end

end
