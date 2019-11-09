module GraphType
  class RawDataType < BaseObject

    field "id", ID, null: false
    field "json", String, null: false
    field "tag", String, null: false

    field "active-at", GraphQL::Types::ISO8601DateTime, null: false
    field "created-at", GraphQL::Types::ISO8601DateTime, null: false
    field "updated-at", GraphQL::Types::ISO8601DateTime, null: false
    field "deleted-at", GraphQL::Types::ISO8601DateTime, null: false
    field "updated-at", GraphQL::Types::ISO8601DateTime, null: false

  end
end
