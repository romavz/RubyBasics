require_relative '../train'
require_relative 'train_modify_command'

class TrainSetRouteCommand < TrainModifyCommand
  protected

  def do_execute
    view_train_route
    puts 'Маршруты доступные для выбора:'
    application.routes.each_with_index { |route, index| puts "#{index + 1}: #{route.name}" }
    print 'Укажите порядковый номер маршрута для привязки или 0 для отмены:'
    index = gets.to_i

    return if index == 0

    if index_not_valid?(index)
      puts "Указан не верный номер станции"
      return
    end

    route = application.routes[index - 1]
    train.route = route
    puts
    view_train_route
  end

  private

  def view_train_route
    puts "Выбран поезд №#{train.number}, #{train.name}"
    route_name = train.route.nil? ? 'не задан' : train.route.name
    puts "маршрут: #{route_name}"
  end

  def index_not_valid?(index)
    index < 1 || index > application.routes.count
  end

end
