module GraphType
  class RawDataType < BaseObject
    include GraphQL::Types

    field "id",         ID,              null: false
    field "json",       String,          null: false
    field "tag",        String,          null: false

    # Timestamps
    field "created-at", ISO8601DateTime, null: false
    field "updated-at", ISO8601DateTime, null: false
    field "deleted-at", ISO8601DateTime, null: false
    field "updated-at", ISO8601DateTime, null: false

  end
end
