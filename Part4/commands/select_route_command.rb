require_relative '../route'
require_relative 'command'

class SelectRouteCommand < Command
  def execute
    return unless application.selected_objects[:route].nil?

    print 'Введите название маршрута: '
    name = gets.chomp!
    route = application.routes.select { |route| route.name == number }[0]
    puts "Маршрут #{name} не найден" if route.nil?
    application.selected_objects[:route] = route
  end
end
