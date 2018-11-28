require_relative '../train'
require_relative 'command'

class SelectTrainCommand < Command
  def execute
    return unless application.selected_objects[:train].nil?

    print 'Введите номер поезда: '
    number = gets.chomp.to_i
    train = application.trains.select { |train| train.number == number }[0]
    puts "Поезд с номером #{number} не найден" if train.nil?
    application.selected_objects[:train] = train
  end
end
