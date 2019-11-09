module GraphType
  class MessageType < BaseObject
    include GraphQL::Types

    field "id",                 ID
    field "content",            String
    field "is-outgoing",        Boolean
    field "person",             PersonType
    field "tinder-message-id",  String
    # Timestamps
    field "created-at",         ISO8601DateTime
    field "deleted-at",         ISO8601DateTime
    field "sent-at",            ISO8601DateTime
  end

end
