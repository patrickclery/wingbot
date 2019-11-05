class CreatePersonFromRecommendation

  # @return Person
  # @param Tinder::Recommendation
  def self.call(recommendation)
    Person.find_or_initialize_by(tinder_id: recommendation.user._id).then do |person|
      person.assign_attributes(bio:           recommendation.user.bio,
                               birthdate:    recommendation.user.birth_date,
                               city:          recommendation.user.city&.name,
                               gender:        recommendation.user.gender,
                               hide_age:      recommendation.user.hide_age,
                               hide_distance: recommendation.user.hide_distance,
                               is_traveling:  recommendation.user.is_traveling,
                               jobs:          recommendation.user.jobs,
                               name:          recommendation.user.name,
                               photos:        recommendation.user.photos,
                               schools:       recommendation.user.schools)
      person.save
      person
    end
  end
end