class ProcessUpdates

  # Fetches the latest updates and handles errors
  # @raise Exception if the request fails
  # @return Boolean true
  class << self

    def call
      RawData.where(imported_at: nil, tag: 'updates').each do |rec|
        Tinder::Updates.new(rec.data) do |updates|
          updates.matches.each do |match|
            Match.from_match(match).save!
          end
        end
        rec.mark_as_imported!
      end
      true
    end

  end
end
