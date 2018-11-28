require_relative '../train'
require_relative 'command'

class SelectTrainCommand < Command
  def execute
    train_already_selected = !application.selected_objects[:train].nil?
    return if train_already_selected

    print 'Введите порядковый номер поезда или 0 для отмены: '
    index = gets.to_i

    return if index == 0

    if index_not_valid?(index)
      puts "Указан не верный порядковый номер поезда"
      return
    end

    train = application.trains[index - 1]
    application.selected_objects[:train] = train
  end

  private

  def index_not_valid?(index)
      index < 1 || index > application.trains.count
  end

end
