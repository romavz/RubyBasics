class MenuItem
  attr_reader :title
  attr_reader :command

  def initialize(title, command)
    @title = title
    @command = command
  end

  def activate
    command.execute unless command.nil?
  end
end
