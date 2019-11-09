module GraphType
  class RawDataType < BaseObject
    include GraphQL::Types

    field "id",         ID
    field "json",       String
    field "tag",        String

    # Timestamps
    field "created-at", ISO8601DateTime
    field "updated-at", ISO8601DateTime
    field "deleted-at", ISO8601DateTime
    field "updated-at", ISO8601DateTime

  end
end
