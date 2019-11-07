class Profile < ApplicationRecord
  belongs_to :account, autosave: true

  # @param Tinder::ActiveProfile pass a profile (ActiveProfile)
  def self.from_profile(profile)
    new name:       profile.user.name,
        is_active:  false,
        data:       profile.user.to_json
  end

end
