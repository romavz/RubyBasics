require_relative '../train'
require_relative 'command'

class SelectTrainCommand < Command
  TRAIN_LIST_IS_EMPTY = 'Список поездов пуст, перед выбором необходимо создать хотя-бы один поезд.'
  TRAIN_NOT_SELECTED = 'Поезд не выбран'

  def execute
    raise StandardError, TRAIN_LIST_IS_EMPTY if application.trains.count == 0

    train_already_selected = !application.selected_objects[:train].nil?
    return if train_already_selected

    print 'Введите порядковый номер поезда или 0 для отмены: '
    index = gets.to_i

    raise StandardError, TRAIN_NOT_SELECTED if index.zero?

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
