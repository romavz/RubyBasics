require_relative '../train'
require_relative 'train_modify_command'

class TrainAddWagonCommand < TrainModifyCommand
  protected

  def do_execute
    view_wagons
    wagon = train.create_wagon
    train.addWagon(wagon)
    view_wagons
  end
end
