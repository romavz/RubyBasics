require_relative '../station'
require_relative 'command'

class ShowStationsCommand < Command
  def execute
    puts 'Станций нет' if application.stations.count == 0
    application.stations.each_with_index { |station, index| puts " #{index + 1}.  #{station.name}" }
    puts ' '
  end
end
