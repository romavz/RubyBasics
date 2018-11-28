require_relative '../route'
require_relative 'command'

class CreateRouteCommand < Command
  def execute
    if application.stations.count < 2
      puts 'Перед созданием маршрута необходимо создать хотя-бы 2 станции.'
      return
    end

    print 'Введите название маршрута: '
    route_name = gets.chomp

    route_exists = !application.routes.index { |route| route.name == route_name }.nil?

    if route_exists
      puts "Маршрут с названием #{route_name} уже есть в списке"
      return
    end

    stations = application.stations
    stations.each_with_index { |station, index| puts "#{index}.  #{station.name}" }
    puts 'Введите через пробел номер начальной и конечной станции: '
    first_index, last_index = gets.split(' ').map(&:to_i)

    new_route = Route.new(route_name, stations[first_index], stations[last_index])
    application.routes << new_route
  end
end
