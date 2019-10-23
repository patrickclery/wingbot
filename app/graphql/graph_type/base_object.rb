module GraphType
  class BaseObject < GraphQL::Schema::Object
    field_class GraphType::BaseField
  end
end
