require_relative '../route'
require_relative '../station'
require_relative 'route_modify_command'

class RouteExcludeStationCommand < RouteModifyCommand
  def do_execute
    stations = route.stations
    show_route_stations(stations)

    puts invitation_message
    station_index = gets.to_i
    return if station_index.zero?

    validate_index!(station_index, stations.count)
    remove_station(station_index, stations)
    show_route_stations(route)
  end

  protected

  def invitation_message
    'Введите порядковый номер станции для исключения из маршрута или \'0\' для отмены'
  end

  private

  def remove_station(station_index, stations)
    station = stations[station_index - 1]
    route.remove_station(station)
  end
end
