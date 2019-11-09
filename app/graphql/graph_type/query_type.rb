module GraphType
  class QueryType < BaseObject
    graphql_name "Query"
    description "The root query"

    field :data, [RawDataType], null: true
    field :people, [PersonType], null: true

    def data
      RawData.all
    end

    def people
      Person.all
    end

    def matches
      Match.all
    end

    def messages
      Message.all
    end
  end
end