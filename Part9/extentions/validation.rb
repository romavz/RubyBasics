module Validation
  def self.included(target)
    target.extend(ClassMethods)
  end

  module ClassMethods
    FIELD_NOT_DEFINED = "Не задано имя аттрибута для валидации"
    VALIDATION_NOT_DEFINED = "Не задан способ валидации аттрибута"

    def validate(field, validation, args = nil)
      raise ArgumentError, FIELD_NOT_DEFINED if field.nil?
      raise ArgumentError, VALIDATION_NOT_DEFINED if validation.nil?

      validations << { field: field, validation: validation, args: args }
    end

    def validate_instance!(obj)
      raise TypeError, "Объект не соответствует типу #{self}" unless obj.is_a?(self)

      validations.each do |item|
        validation = item[:validation]
        validator = validators[validation]
        field = "@#{item[:field]}"
        value = obj.instance_variable_get(field)
        args = item[:args]
        valid = true
        if args.nil?
          valid = validator.call(value)
        else
          valid = validator.call(value, args)
        end

        if !valid
          raise(
            ArgumentError,
            "Валидация #{validation}, для аттрибута #{field} провалилась"
          )
        end
      end
      nil
    end

    private

    attr_reader :validators

    def validators
      @validators ||= {
        presence: lambda { |value| valid_presence?(value) },
        type:     lambda { |value, type| valid_type?(value, type) },
        format:   lambda { |value, format| valid_format?(value, format) }
      }
    end

    def validations
      @validations ||= []
    end

    def valid_presence?(value)
      return false if value.nil? || value.is_a?(String) && value.empty?
      true
    end

    def valid_type?(value, type)
      value.is_a?(type)
    end

    def valid_format?(value, format)
      value =~ format
    end

  end

  def validate!
    self.class.validate_instance!(self)
  end

  def valid?
    validate!
    true
  rescue StandardError
    false
  end

end
