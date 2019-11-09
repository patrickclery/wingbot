module GraphType
  class PersonType < BaseObject

    field "id", ID, null: false
    field "bio", String, null: false
    field "birthdate", GraphQL::Types::ISO8601DateTime, null: false
    field "city", String, null: false
    field "gender", String, null: false
    field "hide-age", Boolean, null: false
    field "hide-distance", Boolean, null: false
    field "instagram-id", String, null: false
    field "instagram-username", String, null: false
    field "is-traveling", Boolean, null: false
    field "name", String, null: false
    field "photos", String, null: false
    field "schools", String, null: false
    field "tinder-id", String, null: false

    # Timestamps
    field "active-at", GraphQL::Types::ISO8601DateTime, null: false
    field "created-at", GraphQL::Types::ISO8601DateTime, null: false
    field "updated-at", GraphQL::Types::ISO8601DateTime, null: false
    field "deleted-at", GraphQL::Types::ISO8601DateTime, null: false
    field "updated-at", GraphQL::Types::ISO8601DateTime, null: false

  end
end
