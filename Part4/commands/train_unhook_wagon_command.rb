require_relative 'train_modify_command'
require_relative '../train'

class TrainUnhookWagonCommand < TrainModifyCommand

  protected

  def do_execute
    train.wagons.each_with_index { |wagon, index| puts "#{index}. #{wagon.properties} " }
    print "Укажите порядковый номер отцепляемого вагона из списка :"
    removed_wagon_index = gets.chomp!.to_i
    if removed_wagon_index = nil
      puts "Указанный номер выходит за пределы списка"
      return
    end
    train.wagons.delete_at(removed_wagon_index)
  end

end
