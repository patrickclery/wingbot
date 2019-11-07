class ProcessUpdates

  # Fetches the latest updates and handles errors
  # @return Boolean true
  def self.call
    RawData.where(imported_at: nil, tag: 'updates').each do |rec|
      rec.to_updates.matches.each do |match_struct|
        Match.from_match(match_struct).then do |match|
          match_struct.messages.each do |message_struct|
            Message.create content:           message_struct.message,
                           created_at:        message_struct.created_date,
                           match:             match,
                           sent_at:           message_struct.sent_date,
                           tinder_message_id: message_struct._id
          end
          match.save!
        end
        rec.mark_as_imported!
      end
    end
    true
  end
end