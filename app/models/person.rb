class Person < ApplicationRecord
  has_many :matches
  serialize :photos

  # @param Tinder::User pass a User struct from a recommendation
  def self.from_user(user:)
    new bio:       user.bio,
        birthdate: user.birth_date,
        gender:    user.gender,
        name:      user.name,
        photos:    user.photos,
        schools:   user.schools,
        tinder_id: user._id
  end

end
