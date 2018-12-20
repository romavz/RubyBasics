require_relative '../route'
require_relative 'modify_command_base'
require_relative '../extentions/index_validator'

class RouteModifyCommand < ModifyCommandBase
  STATION_INDEX_OUT_OF_RANGE_MSG = "Задан недопустимый номер станции. Должен быть 1..".freeze

  include IndexValidator

  attr_reader :route

  protected

  def index_out_of_range_msg
    STATION_INDEX_OUT_OF_RANGE_MSG
  end

  def target_object
    @route = application.selected_objects[:route]
    route
  end

  def target_not_selected_message
    "Маршрут не выбран"
  end

  def show_stations(stations)
    stations.each_with_index do |station, index|
      puts "#{index + 1}. #{station.name}"
    end
  end

  def show_route_stations(route)
    puts "Список станций маршрута #{route.name}:"
    show_stations(route.stations)
  end
end
