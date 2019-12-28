class ProcessRecommendations

  # @return Boolean true
  def self.call
    RawData.where(imported_at: nil, tag: 'recommendations').each do |rec|
      ActiveRecord::Base.transaction do
        rec.to_recommendations.each do |recommendation|
          Person.from_recommendation(recommendation).then do |person|
            # TODO: This will create a new person every time
            person.account = rec.account
            person.save!
          end
        end
        rec.mark_as_imported!
      end
    end
    true
  end

end

