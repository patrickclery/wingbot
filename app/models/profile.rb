class Profile < ApplicationRecord
  belongs_to :account
  serialize :data


  # @param Tinder::ActiveProfile pass a profile (ActiveProfile)
  def self.from_profile(profile:)
    # Create the account first
    Account.from_profile(profile: profile).then do |account|
      Profile.create(account_id: account.id,
                     data:    profile.to_json)
    end
  end
end
