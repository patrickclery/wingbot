class Person < ApplicationRecord
  has_many :matches, autosave: true
  belongs_to :account, required: true, autosave: true

  # @param Tinder::User
  def self.from_recommendation(recommendation)
    obj = new bio:           recommendation.user.bio,
              birthdate:     recommendation.user.birth_date,
              city:          recommendation.user.city&.name,
              gender:        recommendation.user.gender,
              hide_age:      recommendation.user.hide_age,
              hide_distance: recommendation.user.hide_distance,
              is_traveling:  recommendation.user.is_traveling,
              jobs:          recommendation.user.jobs.to_json,
              name:          recommendation.user.name,
              schools:       recommendation.user.schools.to_json
  end

  # @param Tinder::Person
  def self.from_person(person_struct)
    new tinder_id: person_struct._id,
        bio:       person_struct.bio,
        birthdate: person_struct.birth_date,
        gender:    person_struct.gender,
        name:      person_struct.name,
        photos:    person_struct.photos.to_json
  end

end
