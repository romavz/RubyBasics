require_relative '../train'
require_relative 'modify_command_base'

class TrainModifyCommand < ModifyCommandBase
  attr_reader :train

  protected

  def get_target_object
    @train = application.selected_objects[:train]
    train
  end

  def target_not_selected_message
    'Поезд не выбран'
  end

  def view_wagons
    puts 'Состав поезда:'
    train.wagons.each_with_index { |wagon, index| puts "#{index + 1}. #{wagon.get_properties}" }
  end
end
