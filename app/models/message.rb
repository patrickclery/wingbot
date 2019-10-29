class Message < ApplicationRecord
  belongs_to :person

  serialize :photos

  def self.from_message(message:)
    new created_at:        message.created_at,
        from_person_id:    message.from,
        message:           message.message,
        sent_at:           message.sent_at,
        timestamp:         message.timestamp,
        tinder_match_id:   message.match_id,
        tinder_message_id: message._id,
        to_person_id:      message.to
  end

end

