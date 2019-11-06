class CreateMessageFromData

  # @return Account
  # @param Hash JSON response of from a profile request
  def self.call(message:,match:)
    new content:           message.message,
        created_at:        message.created_date,
        match:             match,
        sent_at:           message.sent_date,
        tinder_message_id: message._id
  end
end