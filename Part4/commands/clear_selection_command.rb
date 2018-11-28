require_relative 'command'

class ClearSelectionCommand < Command
  def execute
    application.selected_objects.each { |_key, _value| value = nil }
  end
end
