require_relative './train'
require_relative 'command'

class TrainModifyCommand < Command
  attr_reader :train

  def execute
    train = application.selected_objects[:train]

    if train == nil
      puts "Поезд не выбран"
      return
    end
    do_execute
  end

  protected

  def do_execute

  end

end
