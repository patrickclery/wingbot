module GraphType
  module BaseInterface
    include GraphQL::Schema::Interface

    field_class GraphType::BaseField
  end
end
