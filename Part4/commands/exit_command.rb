require_relative 'command'

class ExitCommand < Command
  def execute
    application.do_exit
  end
end
