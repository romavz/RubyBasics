module InstanceCounter

  def self.included(target)
    target.extend(ClassMethods)
  end

  module ClassMethods

    @@instances = []

    def instances
      self.all.count
    end

    def all
      @@instances
    end

    def register_instance(instance)
      @@instances << instance
    end

  end

  protected

  def register_instance
    self.class.register_instance(self)
  end

end
