module GraphType
  class QueryType < BaseObject
    include GraphQL::Types
    graphql_name "Query"
    description "The root query"

    field :data, [RawDataType], null: true do
      argument :id, ID, required: false
    end

    field :people, [PersonType], null: true do
      argument :id,        ID,          required: false
      argument :name,      String,      required: false
      argument :birthdate, ISO8601Date, required: false
      argument :city,      String,      required: false
      argument :gender,    String,      required: false
    end

    field :messages, [MessageType], null: true do
      argument :id, ID, required: false
    end

    field :matches, [MatchType], null: true do
      argument :id, ID, required: false
    end

    def data(**args)
      RawData.all.where(**args)
    end

    def people(**args)
      Person.all.where(**args)
    end

    def matches(**args)
      Match.all.where(**args)
    end

    def messages(**args)
      Message.all.where(**args)
    end
  end
end