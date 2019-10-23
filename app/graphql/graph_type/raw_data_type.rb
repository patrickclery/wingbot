module GraphType
  class RawDataType < BaseObject
    field :id, ID, null: false
    field :json, String, null: false
    field :tag, String, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :deleted_at, GraphQL::Types::ISO8601DateTime, null: true
  end
end
