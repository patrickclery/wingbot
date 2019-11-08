class Profile < ApplicationRecord
  belongs_to :account, autosave: true

  # @return ApplicationRecord::ActiveProfile
  # @param Tinder::ActiveProfile pass a profile (ActiveProfile)
  def self.from_profile(profile)
    new name:          profile.user.name,
        bio:           profile.user.bio,
        birthdate:     profile.user.birth_date,
        gender:        profile.user.gender,
        hide_age:      profile.plus_control.hide_age,
        hide_distance: profile.plus_control.hide_distance,
        is_traveling:  profile.travel.is_traveling,
        photos:        profile.user.photos
  end

end
