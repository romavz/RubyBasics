require_relative '../route'
require_relative 'command'

class ShowRoutesCommand < Command
  def execute
    routes = application.routes
    puts 'Маршрутов нет' if routes.count == 0
    routes.each_with_index { |route, index| puts "#{index + 1}. #{route.name}" }
    puts ' '
  end
end
