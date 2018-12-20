require_relative '../route'
require_relative '../station'
require_relative 'command'

class RouteIncludeStationCommand < RouteModifyCommand
  def do_execute
    stations = application.stations
    show_stations(stations)
    station = select_station(stations)
    return if station.nil?

    route.add_station(station)
    show_route_stations(route)
  end

  private

  def invitation_message
    "Введите порядковый номер станции для добавления в маршрут или \'0\' для отмены"
  end

  def select_station(stations)
    puts invitation_message
    station_index = gets.to_i
    return nil if station_index.zero?

    validate_index!(station_index, stations.count)
    station = stations[station_index - 1]
    station
  end
end
