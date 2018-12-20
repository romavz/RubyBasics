module InstanceCounter
  def self.included(target)
    target.extend(ClassMethods)
  end

  module ClassMethods
    attr_writer :instances

    def instances
      @instances ||= 0
    end
  end

  protected

  def register_instance
    self.class.instances += 1
  end
end
