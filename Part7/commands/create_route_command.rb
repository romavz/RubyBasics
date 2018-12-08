require_relative '../route'
require_relative 'command'

class CreateRouteCommand < Command

  STATIONS_COUNT_ERROR = 'Перед созданием маршрута необходимо создать хотя-бы 2 станции.'
  ROUTE_NAME_ALREADY_IN_USE = 'Название маршрута уже используется. '
  INPUT_STATIONS_NUMBERS_MESSAGE = 'Введите через пробел номер начальной и конечной станции: '
  SAME_STATION_INDEX = 'Номера станций должны быть разными'
  STATION_INDEX_OUT_OF_RANGE_ERROR = 'Номер станции за пределами списка '

  def execute
    check_stations_count!
    print 'Введите название маршрута: '
    route_name = gets.chomp
    check_route_name!(route_name)
    first_station, last_station = select_stations
    new_route = Route.new(route_name, first_station, last_station)
    application.routes << new_route
  end

  #=============================
  private
  #=============================

  def check_stations_count!
    raise StandardError, STATIONS_COUNT_ERROR  if application.stations.count < 2
  end

  def check_route_name!(route_name)
    route_exists = !application.routes.index { |route| route.name == route_name }.nil?
    raise StandardError, ROUTE_NAME_ALREADY_IN_USE + "#{route_name}" if route_exists
  end

  def select_stations
    stations = application.stations
    stations.each_with_index { |station, index| puts "#{index + 1}.  #{station.name}" }
    puts INPUT_STATIONS_NUMBERS_MESSAGE
    first_index, last_index = gets.split(' ').map(&:to_i)
    check_stations_index!(first_index, last_index)
    [stations[first_index - 1], stations[last_index - 1]]
  end

  def check_stations_index!(first_index, last_index)
    raise StandardError, SAME_STATION_INDEX if first_index == last_index

    stations_count = application.stations.count
    unless first_index.between?(1, stations_count)
      raise StandardError, STATION_INDEX_OUT_OF_RANGE_ERROR + "#{first_index}"
    end
    unless last_index.between?(1, stations_count)
      raise StandardError, STATION_INDEX_OUT_OF_RANGE_ERROR + "#{last_index}"
    end
  end

end
