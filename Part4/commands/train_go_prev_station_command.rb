require_relative '../train'
require_relative 'train_modify_command'

class TrainGoPrevStationCommand < TrainModifyCommand
  protected

  def do_execute
    puts "Станция отправления #{train.current_station.name}"
    train.go_to_prev_station
    puts "Поезд #{train.number} прибыл на станцию #{train.current_station.name}"
  end
end
