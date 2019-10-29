class Person < ApplicationRecord
  has_many :matches
  serialize :photos

  class << self
    # @param Tinder::User pass a User struct from a recommendation
    def from_user(user:)
      new tinder_id: user._id,
          bio:       user.bio,
          birthdate: user.birth_date,
          gender:    user.gender,
          name:      user.name,
          photos:    user.photos,
          schools:   user.schools
    end
  end

end
