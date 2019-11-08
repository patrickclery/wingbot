class ProcessUpdates

  # @return Boolean true
  def self.call
    RawData.where(imported_at: nil, tag: 'updates').each do |rec|
      rec.to_updates.matches.each do |match_struct|
        Match.from_match(match_struct).then do |match|
          match_struct.messages.each do |message_struct|
            Message.from_message(message_struct).then do |message|
              message.match = match
              message.save!
            end
          end
          match.save!
        end
      end
      rec.mark_as_imported!
    end
    true
  end
end