require_relative "command"

class ExitCommand < Command

  def execute
    @application.exit
  end
  
end
