module GraphType
  class BaseInputObject < GraphQL::Schema::InputObject
    argument_class GraphType::BaseArgument
  end
end
