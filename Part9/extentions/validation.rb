module Validation
  def self.included(target)
    target.extend(ClassMethods)
  end

  module ClassMethods
    FIELD_NOT_DEFINED = "Не задано имя аттрибута для валидации".freeze
    VALIDATION_NOT_DEFINED = "Не задан способ валидации аттрибута".freeze
    INVALID_VALIDATION = "Недопустимый тип валидации".freeze

    def validate(field, validation, *args)
      raise ArgumentError, FIELD_NOT_DEFINED if field.nil?
      raise ArgumentError, VALIDATION_NOT_DEFINED if validation.nil?
      raise ArgumentError, INVALID_VALIDATION + " :#{field} :#{validation}" if validators[validation].nil?

      validator = validators[validation]
      validations << { field: field, validator: validator, args: args }
    end

    private

    def validations
      @validations ||= []
    end

    def validators
      @validators ||= {
        presence: lambda { |field, value| valid_presence?(field, value) },
        type:     lambda { |field, value, type| valid_type?(field, value, type) },
        format:   lambda { |field, value, format| valid_format?(field, value, format) }
      }
    end

    def valid_presence?(field, value)
      empty_string = value.is_a?(String) && value.empty?
      raise ArgumentError, "Аттрибут #{field} не установлен" if value.nil? || empty_string
    end

    def valid_type?(field, value, type)
      unless value.is_a?(type)
        raise(ArgumentError,
          "Значение \'#{value}\' аттрибута #{field}, не соответсвует типу #{type}")
      end
    end

    def valid_format?(field, value, format)
      unless value =~ format
        raise(ArgumentError,
          "Значение #{value} аттрибута #{field}, не соответсвует формату #{format}")
      end
    end
  end

  def validate!
    validations = self.class.send(:validations)
    validations.each do |item|
      validator = item[:validator]
      field = "@#{item[:field]}"
      value = instance_variable_get(field)
      args = item[:args]
      validator.call(field, value, *args)
    end
    nil
  end

  def valid?
    validate!
    true
  rescue StandardError
    false
  end
end
