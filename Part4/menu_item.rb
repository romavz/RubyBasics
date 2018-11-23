class MenuItem
  attr_reader :title
  
  def initialize(title, command)
    @title = title
    @command = command
  end

  def activate
    command.execute if command != nil
  end

end
