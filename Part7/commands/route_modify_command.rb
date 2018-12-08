require_relative '../route'
require_relative 'modify_command_base'

class RouteModifyCommand < ModifyCommandBase
  attr_reader :route

  protected

  def get_target_object
    @route = application.selected_objects[:route]
    route
  end

  def target_not_selected_message
    'Маршрут не выбран'
  end

  def show_route_stations(route)
    puts "Список станций маршрута #{route.name}:"
    route.stations.each_with_index do |station, index|
      puts "#{index + 1}. #{station.name}"
    end
  end
end
