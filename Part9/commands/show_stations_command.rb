require_relative '../station'
require_relative 'command'

class ShowStationsCommand < Command
  def execute
    stations = application.stations
    puts 'Станций нет' if stations.count.zero?
    stations.each_with_index { |station, index| puts " #{index + 1}.  #{station.name}" }
    puts ' '
  end
end
