require './cargo_train.rb'
require './menu_item.rb'
require './main.rb'
require './wagon.rb'
require './cargo_wagon.rb'
require './menu_decorator.rb'
require './passenger_wagon.rb'
require './train.rb'
require './menu.rb'
require './passenger_train.rb'
require './route.rb'
require './station.rb'

require './commands/route_exclude_station_command.rb'
require './commands/train_go_prev_station.rb'
require './commands/show_station_trains_command.rb'
require './commands/route_include_staton_command.rb'
require './commands/train_add_wagon_command.rb'
require './commands/create_route_command.rb'
require './commands/create_passenger_train_command.rb'
require './commands/create_cargo_train.rb'
require './commands/select_route_command.rb'
require './commands/create_station_command.rb'
require './commands/exit_command.rb'
require './commands/route_modify_command.rb'
require './commands/show_trains_command.rb'
require './commands/show_routes_command.rb'
require './commands/clear_selection_command.rb'
require './commands/show_stations_command.rb'
require './commands/select_train_command.rb'
require './commands/train_change_speed_command.rb'
require './commands/train_set_route_command.rb'
require './commands/modify_command_base.rb'
require './commands/train_go_next_station_command.rb'
require './commands/train_modify_command.rb'
require './commands/command.rb'
require './commands/create_train_command.rb'
require './commands/train_unhook_wagon_command.rb'

class Application
  attr_reader :stations
  attr_reader :routes
  attr_reader :trains
  attr_reader :wagons
  attr_reader :selected_objects

  def initialize
    @stations = []
    @routes = []
    @trains = []
    @wagons = []
    @selected_objects = { station: nil, route: nil, train: nil }
  end

  def run
    current_menu = create_main_menu
    current_menu.activate

    loop do
      item_id = gets.chomp!
      if current_menu[item_id].nil?
        puts 'Введите идентификатор команды, входящий в список'
        current_menu.activate
        next
      end
      if current_menu[item_id].is_a? Menu
        current_menu = current_menu[item_id]
      else
        current_menu[item_id].activate
      end
      current_menu.activate
    end
  end

  def do_exit
    exit
  end

  #-----------------------------
  #   Private Section
  #-----------------------------
  private

  attr_reader :main_menu

  def create_main_menu
    exit = ExitCommand.new(self)
    main_menu = Menu.new('Главное меню', nil)
    main_menu.add('1', stations_menu(main_menu))
    main_menu.add('2', trains_menu(main_menu))
    main_menu.add('3', routes_menu(main_menu))
    main_menu.add('0', MenuItem.new('Выход', exit))
    main_menu
  end

  def stations_menu(parent_menu)
    menu = Menu.new('Станции', ShowStationsCommand.new(self))
    menu.add('1', MenuItem.new('Создать станцию', CreateStationCommand.new(self)))
    menu.add('2', MenuItem.new('Показать список поездов на станции', ShowStationTrainsCommand.new(self)))
    menu.add('0', parent_menu)
    menu
  end

  def trains_menu(parent_menu)
    show_trains = ShowTrainsCommand.new(self)
    menu = Menu.new('Поезда', show_trains)
    menu.add('1', MenuItem.new('Создать пассажирский поезд', CreatePassengerTrainCommand.new(self)))
    menu.add('2', MenuItem.new('Создать грузовой поезд', CreateCargoTrainCommand.new(self)))
    menu.add('3', select_train_menu(menu))
    menu.add('0', parent_menu)
    menu
  end

  def select_train_menu(parent_menu)
    menu = Menu.new('Выбрать поезд', SelectTrainCommand.new(self))
    menu.add('1', MenuItem.new('Назначить маршрут', TrainSetRouteCommand.new(self)))
    menu.add('2', MenuItem.new('Прицепить вагон', TrainAddWagonCommand.new(self)))
    menu.add('3', MenuItem.new('Отцепить вагон', TrainUnhookWagonCommand.new(self)))
    menu.add('4', MenuItem.new('Изменить скорость', TrainChangeSpeedCommand.new(self)))
    menu.add('5', MenuItem.new('Отправить на следующую станцию', TrainGoNextStationCommand.new(self)))
    menu.add('6', MenuItem.new('Вернуть на предыдущую станцию', TrainGoPrevStationCommand.new(self)))
    menu.add('0', clear_selection_decorator(parent_menu))
    menu
  end

  def routes_menu(parent_menu)
    show_routes = ShowRoutesCommand.new(self)

    menu = Menu.new('Маршруты', show_routes)
    menu.add('1', MenuItem.new('Создать маршрут', CreateRouteCommand.new(self)))
    menu.add('2', select_route_menu(menu))
    menu.add('0', parent_menu)
    menu
  end

  def select_route_menu(parent_menu)
    menu = Menu.new('Выбрать маршрут', SelectRouteCommand.new(self))
    # выбрать маршрут
    menu.add('1', MenuItem.new('Добавить станцию', RouteIncludeStationCommand.new(self)))
    menu.add('2', MenuItem.new('Исключить станцию', RouteExcludeStationCommand.new(self)))
    menu.add('0', clear_selection_decorator(parent_menu))
    menu
  end

  def clear_selection_decorator(parent_menu)
    menu_decorator = MenuDecorator.new(parent_menu.title, ClearSelectionCommand.new(self))
    menu_decorator.target_menu = parent_menu
    menu_decorator
  end
end

application = Application.new
application.run
