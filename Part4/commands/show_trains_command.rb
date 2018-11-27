require_relative './train'
require_relative 'command'

class ShowTrainsCommand < Command
  def execute
    trains = application.trains
    puts 'Список поездов:'
    trains.each { |train| puts "  №#{train.number} - #{train.name} (#{train.type})" }
  end

end
