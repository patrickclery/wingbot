class ProcessRecommendations

  # Fetches the latest profile and handles errors
  # @raise Exception if the request fails
  # @return Boolean true
  # @param Tinder::Account Pass the account struct in
  def self.call
    RawData.where(imported_at: nil, tag: 'recommendations').each do |rec|
      rec.to_recommendations.each do |recommendation|
        tinder_account_id = recommendation.user._id
        account           = Account.find_or_initialize_by(tinder_id: tinder_account_id)
        account.assign_attributes is_email_verified: false,
                                  is_active:         false,
                                  name:              recommendation.user.name,
                                  email:             recommendation.account.account_email,
                                  phone_number:      recommendation.account.account_phone_number,
                                  data:              recommendation.to_json


        Person.find_or_initialize_by(tinder_id: recommendation.user._id).then do |person|
          person.assign_attributes bio:           recommendation.user.bio,
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
          person.save
          person
        end
      end
      rec.mark_as_imported!
    end
    true
  end

end

