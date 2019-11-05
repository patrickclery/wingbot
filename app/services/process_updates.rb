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
          updates.messages.each do |message|
            Message.from_message(message).save!
          end
          rec.mark_as_imported!
        end
        true
      end

    end
  end
end