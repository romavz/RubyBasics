require_relative 'train_modify_command'
require_relative '../train'

class TrainUnhookWagonCommand < TrainModifyCommand
  protected

  def do_execute
    view_wagons
    print 'Укажите порядковый номер отцепляемого вагона из списка, или 0 для отмены :'
    removed_wagon_index = gets.to_i

    return unless valid_wagon_index?(removed_wagon_index)

    train.wagons.delete_at(removed_wagon_index - 1)
    view_wagons
  end

  private

  def valid_wagon_index?(index)
    index > 1 && index < train.wagons.count + 1
  end
end
