module GraphType
  class BaseObject < GraphQL::Schema::Object
    field_class GraphType::BaseField

    # Modifies `field` to add `null: false` on each line, since it was redundant
    def self.field(*args, **kwargs, &block)
      kwargs[:null] ||= false
      super
    end
  end
end
