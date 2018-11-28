require_relative '../station'
require_relative '../train'
require_relative 'command'

class ShowStationTrainsCommand < Command
  def execute
    print 'Введите название станции: '
    station_name = gets.chomp!
    station = application.stations.select{ |station| station.name == station_name }[0]

    if station.nil?
      puts "Станция #{station_name} не найдена"
      return
    end

    puts "Поезда на станции: #{station_name}:"
    puts "Поездов нет." if station.trains.count.zero?
    station.trains.each do |train|
      puts "  №#{train.number} - #{train.name} (#{train.type})"
    end
    puts " "
  end
end
