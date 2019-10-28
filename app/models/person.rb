class Person < ApplicationRecord
  has_many :matches
  serialize :photos

  class << self
    # @param Tinder::User pass a User struct from a recommendation
    def from_user(user:)
      # Mass assign everything
      new birthdate: user.birth_date,
          tinder_id: user._id,
          bio:       user.bio,
          name:      user.name,
          photos:    user.photos,
          gender:    user.gender,
          schools:   user.schools
    end
  end

end
