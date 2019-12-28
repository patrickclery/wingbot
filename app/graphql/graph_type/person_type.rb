module GraphType
  class PersonType < BaseObject
    include GraphQL::Types

    field "id",                 ID
    field "bio",                String
    field "birthdate",          ISO8601Date
    field "city",               String
    field "gender",             String
    field "hide-age",           Boolean
    field "hide-distance",      Boolean
    field "instagram-id",       String
    field "instagram-username", String
    field "is-traveling",       Boolean
    field "name",               String
    field "photos",             String
    field "schools",            String
    field "tinder-id",          String

    # Timestamps
    field "active-at",          ISO8601DateTime
    field "created-at",         ISO8601DateTime
    field "updated-at",         ISO8601DateTime
    field "deleted-at",         ISO8601DateTime
    field "updated-at",         ISO8601DateTime

  end

end
