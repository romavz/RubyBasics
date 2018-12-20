module Accessor
  def self.included(target)
    target.extend(ClassMethods)
  end

  module ClassMethods
    ATTR_NAME_NOT_SYMBOL = "Attribute name is not symbol"
    TYPE_MISSING = "Тип значения не соответсвует типу аттрибута"

    def attr_accessor_with_history(*attrs)
      attrs.each do |attr|
        raise TypeError, ATTR_NAME_NOT_SYMBOL unless attr.is_a?(Symbol)

        attr_name = "@#{attr}"
        attr_history = "#{attr}_history".to_sym
        history_var = "@#{attr}_history".to_sym

        define_method(attr_history) do
          instance_variable_get(history_var) || instance_variable_set(history_var, [])
        end

        define_method(attr) { instance_variable_get(attr_name) }
        define_method("#{attr}=") do |value|
          instance_variable_set(attr_name, value)
          history = method(attr_history).call
          history << value
        end
      end
    end

    def strong_attr_accessor(method, type)
      raise TypeError, ATTR_NAME_NOT_SYMBOL unless method.is_a?(Symbol)

      define_method(method) do
        instance_variable_get("@#{method}") ||
          instance_variable_set("@#{method}", nil)
      end

      define_method("#{method}=") do |value|
        raise TypeError, TYPE_MISSING unless value.is_a?(type)

        instance_variable_set("@#{method}", value)
      end
    end
  end

end

#class_variable_get :@@var
#class_variable_set :@@var, value

#instance_variable_get
#instance_variable_set

#define_method
#const_get
