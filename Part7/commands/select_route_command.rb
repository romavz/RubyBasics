require_relative '../route'
require_relative 'command'

class SelectRouteCommand < Command
  ROUTE_LIST_IS_EMPTY = 'Список маршрутов пуст, перед выбором необходимо создать хотя-бы один маршрут.'

  def execute
    raise StandardError, ROUTE_LIST_IS_EMPTY if application.routes.count == 0

    route_already_selected = !application.selected_objects[:route].nil?
    return if route_already_selected

    print 'Введите порядковый номер маршрута или 0 для отмены: '
    index = gets.to_i

    return if index == 0

    if route_index_not_valid?(index)
      raise ArgumentError, "Задан номер #{index}, должен быть 1..#{application.routes.count}"
    end

    route = application.routes[index - 1]
    application.selected_objects[:route] = route
  end

  private

  def route_index_not_valid?(index)
    index < 1 || index > application.routes.count
  end

end
