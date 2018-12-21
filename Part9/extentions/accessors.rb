module Accessor
  def self.included(target)
    target.extend(ClassMethods)
  end

  module ClassMethods
    ATTR_NAME_NOT_SYMBOL = "Attribute name is not symbol".freeze
    TYPE_MISSING = "Тип значения не соответсвует типу аттрибута".freeze

    def attr_accessor_with_history(*attrs)
      attrs.each do |attr|
        raise TypeError, ATTR_NAME_NOT_SYMBOL unless attr.is_a?(Symbol)

        attr_name = "@#{attr}"
        attr_history = "#{attr}_history".to_sym
        history_var = "@#{attr}_history".to_sym

        define_method(attr_history) do
          instance_variable_get(history_var) ||
            instance_variable_set(history_var, [])
        end

        define_method(attr) { instance_variable_get(attr_name) || nil }
        define_method("#{attr}=") do |value|
          attr_value = method(attr).call
          history = method(attr_history).call
          first_assign = history.empty? && attr_value.nil?
          history << attr_value unless first_assign || value == attr_value
          instance_variable_set(attr_name, value)
        end
      end
    end

    def strong_attr_accessor(name, type)
      raise TypeError, ATTR_NAME_NOT_SYMBOL unless name.is_a?(Symbol)

      define_method(name) do
        instance_variable_get("@#{name}") ||
          instance_variable_set("@#{name}", nil)
      end

      define_method("#{name}=") do |value|
        raise TypeError, TYPE_MISSING unless value.is_a?(type)

        instance_variable_set("@#{name}", value)
      end
    end
  end
end
