require_relative 'command'

class ClearSelectionCommand < Command
  def execute
    application.selected_objects.keys.each { |key|  application.selected_objects[key] = nil }
  end
end
