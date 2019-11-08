class Person < ApplicationRecord
  has_many :matches, autosave: true
  belongs_to :account, required: true, autosave: true

  # @param Tinder::User
  def self.from_recommendation(recommendation)
    new bio:           recommendation.user.bio,
        birthdate:     recommendation.user.birth_date,
        city:          recommendation.user.city&.name,
        gender:        recommendation.user.gender,
        hide_age:      recommendation.user.hide_age,
        hide_distance: recommendation.user.hide_distance,
        is_traveling:  recommendation.user.is_traveling,
        jobs:          recommendation.user.jobs,
        name:          recommendation.user.name,
        photos:        recommendation.user.photos,
        schools:       recommendation.user.schools
  end

  # @param Tinder::Person
  def self.from_person(person_struct)
    new tinder_id: person_struct._id,
        bio:       person_struct.bio,
        birthdate: person_struct.birth_date,
        gender:    person_struct.gender,
        name:      person_struct.name,
        photos:    person_struct.photos
  end

end
