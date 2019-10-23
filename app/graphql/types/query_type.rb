module Types
  class QueryType < Types::BaseObject
    graphql_name "Query"
    description "The root query"

    field :data, [RawDataType], null: true

    def data
      RawData.all
    end
  end
end