class Person < ApplicationRecord

  serialize :photos

  class << self
    def from_recommendation(recommendation:)
      # Mass assign everything
      new birthdate: recommendation.user.birth_date,
          tinder_id: recommendation.user._id,
          bio:       recommendation.user.bio,
          name:      recommendation.user.name,
          photos:    recommendation.user.photos,
          gender:    recommendation.user.gender,
          schools:   recommendation.user.schools,
          name:      recommendation.user.name
    end
  end

end
