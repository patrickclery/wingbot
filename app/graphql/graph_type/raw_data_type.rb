module GraphType
  class RawDataType < BaseObject
    field :id, ID, null: false
    field :json, String, null: false
    field :tag, String, null: false
    field :imported_at, String, null: false
    field :created_at, String, null: false
    field :deleted_at, String, null: true
  end
end
