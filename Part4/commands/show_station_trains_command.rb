require_relative './station'
require_relative './train'
require_relative 'command'

class ShowStationsCommand < Command
  def execute
    print 'Введите название станции: '
    station_name = gets.chomp!
    station = application.stations[station_name]

    if station == nil
      puts "Станция #{station_name} не найдена"
      return
    end

    puts "Поезда на станции: #{station_name}"
    station.trains.each do |train|
      puts "  №#{train.number} - #{train.name} (#{train.type})"
    end

  end
end
