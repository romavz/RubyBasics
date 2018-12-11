require_relative 'command'

class MultiCommand < Command
  attr_reader :commands

  def initialize(application)
    super(application)
    @commands = []
  end

  def add(command)
    commands << command
  end

  def execute
    commands.each(&:execute)
  end

end
