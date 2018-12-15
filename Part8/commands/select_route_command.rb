require_relative '../route'
require_relative 'command'
require_relative '../extentions/index_validator'

class SelectRouteCommand < Command
  ROUTE_LIST_IS_EMPTY = "Список маршрутов пуст, перед выбором необходимо создать хотя-бы один маршрут.".freeze
  ROUTE_INDEX_OUT_OF_RANGE = "Неправильный номер маршрута, должен быть 1..".freeze
  INVITATION_MSG = "Введите порядковый номер маршрута или 0 для отмены: ".freeze

  include IndexValidator

  def execute
    routes = application.routes
    raise StandardError, ROUTE_LIST_IS_EMPTY if routes.count.zero?

    route_already_selected = !application.selected_objects[:route].nil?
    return if route_already_selected

    print INVITATION_MSG
    index = gets.to_i
    return if index.zero?

    validate_index!(index, routes.count)
    route = routes[index - 1]
    application.selected_objects[:route] = route
  end

  protected

  def index_out_of_range_msg
    ROUTE_INDEX_OUT_OF_RANGE
  end
end
