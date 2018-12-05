require_relative '../train'
require_relative 'command'

class SelectTrainCommand < Command
  def execute
    train_already_selected = !application.selected_objects[:train].nil?
    return if train_already_selected

    print 'Введите порядковый номер поезда или 0 для отмены: '
    index = gets.to_i

    return if index == 0

    if index_out_of_range?(index)
      raise ArgumentError, "Задан номер #{index}, должен быть 1..#{application.trains.count}"
    end

    train = application.trains[index - 1]
    application.selected_objects[:train] = train
  end

  private

  def index_out_of_range?(index)
    index < 1 || index > application.trains.count
  end

end
