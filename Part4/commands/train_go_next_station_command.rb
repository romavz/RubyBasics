require_relative '../train'
require_relative 'train_modify_command'

class TrainGoNextStationCommand < TrainModifyCommand
  protected

  def do_execute
    puts "Станция отправления #{train.current_station}"
    train.go_to_next_station
    puts "Поезд #{train.number} прибыл на станцию #{train.current_station}"
  end
end
