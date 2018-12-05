require_relative '../route'
require_relative '../station'
require_relative 'command'

class RouteIncludeStationCommand < RouteModifyCommand
  def do_execute
    stations = application.stations
    stations.each_with_index do |station, index|
      puts "#{index + 1}. #{station.name}"
    end

    puts 'Введите порядковый номер станции для добавления в маршрут или \'0\' для отмены'

    user_choice = gets.chomp!
    return if user_choice == '0' || user_choice.nil?

    station_index = user_choice.to_i
    message = "Задан недопустимый номер станции. Должен быть 1..#{stations.count}"
    raise ArgumentError, message if station_index < 1 || station_index > stations.count

    station = stations[station_index - 1]
    route.add_station(station)

    show_route_stations(route)
  end
end
