class ProcessRecommendations

  # Fetches the latest profile and handles errors
  # @raise Exception if the request fails
  # @return Boolean true
  # @param Tinder::Account Pass the account struct in
  def self.call
    RawData.where(imported_at: nil, tag: 'recommendations').each do |rec|
      rec.to_recommendations.each do |recommendation|
        Person.from_recommendation(recommendation).then do |person|
          person.account ||= rec.account
          person.save!
        end
      end
      rec.mark_as_imported!
    end
    true
  end

end

