class Message < ApplicationRecord
  has_many :replies, class_name: 'Message', foreign_key: 'parent_id'
  belongs_to :message, foreign_key: 'parent_id', optional: true
  belongs_to :match

  serialize :photos

  # @return ApplicationRecord::Message
  # @param Tinder::Message
  def self.from_message(message)
    match = Match.find_by(tinder_match_id: message.match_id)
    new content:           message.message,
        created_at:        message.created_date,
        match:             match,
        sent_at:           message.sent_date,
        tinder_message_id: message._id
  end

end

