require_relative '../train'
require_relative 'command'

class ShowTrainsCommand < Command
  def execute
    trains = application.trains
    puts 'Поездов нет' if trains.count.zero?
    trains.each_with_index do |train, index|
      puts " #{index + 1}.  №#{train.number} - #{train.name} (#{train.type})"
    end
  end
end
