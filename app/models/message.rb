class Message < ApplicationRecord
  belongs_to :person

  serialize :photos

  def self.from_message(message:)
    new content:           message.message,
        created_at:        message.created_date,
        from_id:           message.from,
        sent_at:           message.sent_date,
        tinder_match_id:   message.match_id,
        tinder_message_id: message._id,
        tinder_timestamp:  message.timestamp,
        to_id:             message.to
  end

end

