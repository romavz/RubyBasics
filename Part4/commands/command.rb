
class Command  
  def initialize(application)
    @application = application
  end

  def execute
    # TODO: Переопределить в наследниках
  end

  protected

  attr_accessor :application
end
