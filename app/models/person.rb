class Person < ApplicationRecord
  has_many :matches, autosave: true
  belongs_to :account, optional: false, autosave: true

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

  # @param Tinder::Person
  def self.from_person(person_struct)
    new tinder_id:  person_struct._id,
        bio:        person_struct.bio,
        birthdate: person_struct.birth_date,
        gender:     person_struct.gender,
        name:       person_struct.name,
        photos:     person_struct.photos
  end

end
