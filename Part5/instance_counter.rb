module InstanceCounter

  def self.included(target)
    target.extend(ClassMethods)
  end

  module ClassMethods

    def self.extended(target_class)

      target_class.class_exec {
        class << self
          attr_accessor :instances

          #def register_instance(obj)
          #   @instances += 1
          #end
        end

        def self.inherited(subclass)
          subclass.instance_variable_set(:@instances, 0)
        end
      }

      target_class.instance_variable_set(:@instances, 0)

    end

  end

  protected

  def register_instance
    self.class.instances += 1
  end

end
