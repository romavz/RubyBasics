require_relative './train'
require_relative 'train_modify_command'

class TrainSetRouteCommand < TrainModifyCommand

  protected

  def do_execute
    view_train_route
    puts "Маршруты доступные для выбора:"
    application.routes.each_with_index { |route, index| puts "#{index}: #{route.name}" }
    print 'Укажите порядковый номер маршрута для привязки:'
    index = gets.chomp!.to_i
    route = application.routes[index]
    self.train.route = route
    puts
    view_train_route
  end

  private

  def view_train_route
    train = self.train
    puts "Выбран поезд №#{train.number}, #{train.name}"
    route_name = train.route.nil? ? "не задан" : train.route.name
    puts "маршрут: #{route_name}"
  end

end
