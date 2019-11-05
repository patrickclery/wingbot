class ProcessUpdates

  # Fetches the latest updates and handles errors
  # @raise Exception if the request fails
  # @return Boolean true
  class << self

    def call(account)
      RawData.where(imported_at: nil, tag: 'updates').each do |rec|
        Tinder::Updates.new(rec.data).then do |updates|
          updates.matches.each do |match|
            obj = Match.from_match(match)
            obj.account = account
            obj.save!
          end
          updates.messages.each do |message|
            obj = Message.from_message(message).save!
            obj.account = account
            obj.save!
          end
          rec.mark_as_imported!
        end
      end
      true

    end
  end
end