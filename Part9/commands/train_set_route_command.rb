require_relative '../train'
require_relative 'train_modify_command'
require_relative '../extentions/index_validator'

class TrainSetRouteCommand < TrainModifyCommand
  INVITATION_MSG = "Укажите порядковый номер маршрута для привязки или 0 для отмены:".freeze
  ROUTE_INDEX_OUT_OF_RANGE_MSG = "Задан недопустимый номер маршрута. Должен быть 1..".freeze

  include IndexValidator

  protected

  def do_execute
    view_train_route
    puts 'Маршруты доступные для выбора:'
    routes = application.routes
    routes.each_with_index { |route, index| puts "#{index + 1}: #{route.name}" }

    print INVITATION_MSG
    index = gets.to_i
    return if index.zero?

    validate_index!(index, routes.count)

    route = routes[index - 1]
    train.route = route
    view_train_route
  end

  def index_out_of_range_msg
    ROUTE_INDEX_OUT_OF_RANGE
  end

  private

  def view_train_route
    puts "Выбран поезд №#{train.number}, #{train.name}"
    route_name = train.route.nil? ? 'не задан' : train.route.name
    puts "маршрут: #{route_name}"
  end
end
