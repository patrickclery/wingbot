module GraphType
  class BaseField < GraphQL::Schema::Field
    argument_class GraphType::BaseArgument

    def resolve_field(obj, args, ctx)
      resolve(obj, args, ctx)
    end
  end
end
