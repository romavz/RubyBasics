require_relative 'command'

class ModifyCommandBase < Command
  # шаблонный метод
  def execute
    if target_object.nil?
      target_not_selected_message
      return
    end
    do_execute
  end

  protected

  def target_object
    # переопределить в наследниках
  end

  def target_not_selected_message
    # переопределить в наследниках
  end

  def do_execute
    # должен быть переопределен в наследниках для выполнения конкретных
    # операций над поездом
  end
end
