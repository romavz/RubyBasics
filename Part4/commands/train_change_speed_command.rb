require_relative '../train'
require_relative 'train_modify_command'

class TrainChangeSpeedCommand < TrainModifyCommand
  protected

  def do_execute
    current_speed_message
    print 'Введите приращение скорости (положительное или отрицательное): '
    value = gets.to_i
    if value > 0
      train.speed_up(value)
    else
      train.speed_down(value)
    end
    current_speed_message
  end

  private

  def current_speed_message
    puts "Текущая скорость поезда: #{train.speed}"
  end
end
