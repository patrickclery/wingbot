module GraphType
  class MatchType < BaseObject
    include GraphQL::Types

    field "id",                    ID
    field "common-friend-count",   Integer
    field "common-like-count",     Integer
    field "is-boost-match",        Boolean
    field "is-closed",             Boolean
    field "is-dead",               Boolean
    field "is-fast-match",         Boolean
    field "is-following",          Boolean
    field "is-following-moments",  Boolean
    field "is-muted",              Boolean
    field "is-pending",            Boolean
    field "is-super-like",         Boolean
    field "participants",          [Integer]
    field "person-id",             Integer
    field "readreceipt",           [Integer]
    field "seen",                  [Integer]
    field "tinder-match-id",       String
    # Timestamps
    field "created-at",            ISO8601DateTime
    field "deleted-at",            ISO8601DateTime
    field "last-active-at",        ISO8601DateTime
    field "matched-at",            ISO8601DateTime
    field "sent-at",               ISO8601DateTime
  end

end
