require_relative '../train'
require_relative 'command'
require_relative '../extentions/index_validator'

class SelectTrainCommand < Command
  TRAIN_LIST_IS_EMPTY = "Список поездов пуст, перед выбором необходимо создать хотя-бы один поезд.".freeze
  TRAIN_NOT_SELECTED = "Поезд не выбран".freeze
  INVITATION_MSG = "Введите порядковый номер поезда или 0 для отмены: ".freeze
  TRAIN_INDEX_OUT_OF_RANGE_MSG = "Задан недопустимый номер поезда, должен быть 1..".freeze

  include IndexValidator

  def execute
    trains = application.trains
    raise StandardError, TRAIN_LIST_IS_EMPTY if trains.count.zero?

    train_already_selected = !application.selected_objects[:train].nil?
    return if train_already_selected

    print INVITATION_MSG
    index = gets.to_i
    return if index.zero?

    validate_index!(index, trains.count)

    train = application.trains[index - 1]
    application.selected_objects[:train] = train
  end

  def index_out_of_range_msg
    TRAIN_INDEX_OUT_OF_RANGE_MSG
  end

  #==========================
  private

  #==========================
  def validate_selected_index!(index, trains_count)
    return if index.between(1, trains_count)

    raise ArgumentError, "Задан номер #{index}, должен быть 1..#{trains.count}"
  end
end
