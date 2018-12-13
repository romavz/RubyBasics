require_relative 'command'
require_relative '../train'
require_relative '../wagon'

class TrainShowWagonsCommand < Command

  def execute
    train = application.selected_objects[:train]
    return if train.nil?
    puts "Выбран поезд №#{train.number} - #{train.name}"
    show_wagons(train)
  end

  def show_wagons(train)
    index = 0
    return if train.wagons.count.zero?
    puts 'Состав:'
    train.each_wagon do |wagon|
      index += 1
      puts "#{index}. #{wagon.properties}"
    end
    puts ' '
  end
end
