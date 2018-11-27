require_relative 'command'

class ClearSelectionCommand < Command

  def execute
    self.application.selected_objects.each { |key, value| value = nil  }
  end

end
