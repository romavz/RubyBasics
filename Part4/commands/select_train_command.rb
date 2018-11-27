require_relative './train'
require_relative 'command'

class SelectTrainCommand

  def execute
    return if application.selected_objects[:train] != nil
    print 'Введите номер поезда: '
    number = gets.chomp.to_i
    train = application.trains.select { |train| train.number == number }[0]
    if train == nil
      puts "Поезд с номером #{number} не найден"
    end
    application.selected_objects[:train = train]
  end

end
