require_relative '../station'
require_relative '../train'
require_relative 'command'

class ShowStationTrainsCommand < Command
  def execute
    print 'Введите номер станции: '
    index = gets.to_i

    return if index == 0

    if index_not_valid?(index)
      puts "Указан не верный номер станции"
      return
    end

    station = application.stations[index - 1]

    if station.nil?
      puts "Станция не определена"
      return
    end

    puts "Поезда на станции: #{station_name}:"
    puts "Поездов нет." if station.trains.count.zero?
    station.each_train do |train|
      puts "  №#{train.number} - #{train.name} (#{train.type})"
      train.each_wagon do |wagon|
        wagon.properties.each {|property| puts "    #{property}"}
      end
      puts " "
    end
    puts " "
  end

  def index_not_valid?(index)
    index < 1 || index > application.stations.count
  end

end
