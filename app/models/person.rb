class Person < ApplicationRecord
  has_many :matches
  belongs_to :account # The initial import account

  serialize :photos

  # @param Tinder::User pass a User struct from a recommendation
  def self.from_recommendation(recommendation)
    new bio:       recommendation.user.bio,
        birthdate: recommendation.user.birth_date,
        gender:    recommendation.user.gender,
        name:      recommendation.user.name,
        photos:    recommendation.user.photos,
        schools:   recommendation.user.schools,
        tinder_id: recommendation.user._id
  end

end
