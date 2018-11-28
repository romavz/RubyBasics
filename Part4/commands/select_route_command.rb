require_relative '../route'
require_relative 'command'

class SelectRouteCommand < Command
  def execute
    route_already_selected =  !application.selected_objects[:route].nil?
    return if route_already_selected

    print 'Введите порядковый номер маршрута или 0 для отмены: '
    index = gets.to_i

    return if index == 0

    if route_index_not_valid?(index)
      puts "Указан не верный номер маршрута"
      return
    end

    route = application.routes[index - 1]
    application.selected_objects[:route] = route
  end

  private

  def route_index_not_valid?(index)
    index < 1 || index > application.routes.count
  end

end
