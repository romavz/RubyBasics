require_relative "command"
require_relative "exit_command"


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
      if current_menu[item_id] == nil
        puts "Введите идентификатор команды, входящий в список"
        redo
      end
      if current_menu[item_id].is_a? Menu
        current_menu = current_menu[item_id]
      else
        current_menu[item_id].activate
      end
      current_menu.activate
    end
  end

  def exit
    break
  end

#-----------------------------
#   Private Section
#-----------------------------
  private

  attr_reader :main_menu

  def create_main_menu
    exit = ExitCommand.new(self)
    main_menu = Menu.new("Главное меню", nil)
    main_menu.add("1", stations_menu(main_menu))
    main_menu.add("2", trains_menu(main_menu))
    main_menu.add("3", routes_menu(main_menu))
    main_menu.add("0", MenuItem.new("Выход", exit))
    main_menu
  end

  def stations_menu(parent_menu)
    menu = Menu.new("Станции", ShowStationsCommand.new(self))
    menu.add("1", MenuItem.new("Создать станцию", CreateStationCommand.new(self)))
    menu.add("2", MenuItem.new("Показать список поездов на станции", ShowStationTranisCommand(self)))
    menu.add("0", parent_menu)
    menu
  end

  def trains_menu(parent_menu)
    show_trains = ShowTrainsCommand.new(self)
    menu = Menu.new("Поезда", show_trains)
    menu.add("1", MenuItem.new("Создать пассажирский поезд", CreatePassengerTrainCommand(self)))
    menu.add("2", MenuItem.new("Создать грузовой поезд", CreateCargoTrainCommand(self)))
    menu.add("3", select_train_menu(menu))
    menu.add("0", parent_menu)
    menu
  end

  def select_train_menu(parent_menu)
    menu = Menu.new("Выбрать поезд", SelectTrainCommand.new(self))
    menu.add("1", MenuItem.new("Назначить маршрут", TrainSetRouteCommand.new(self)))
    menu.add("2", MenuItem.new("Прицепить вагон", TrainAddWagonCommand.new(self)))
    menu.add("3", MenuItem.new("Отцепить вагон", TrainUnhookWagonCommand.new(self)))
    menu.add("4", MenuItem.new("Изменить скорость", TrainChangeSpeedCommand.new(self)))
    menu.add("5", MenuItem.new("Отправить на следующую станцию", TrainGoNextStationCommand.new(self)))
    menu.add("6", MenuItem.new("Вернуть на предыдущую станцию", TrainGoPrevStationCommand.new(self)))
    menu.add("0", clear_selection_decorator(parent_menu))
  end

  def routes_menu(parent_menu)
    show_routes = ShowRoutesCommand.new(self.routes)
    select_route = select_route_menu(show_routes)

    menu = Menu.new("Маршруты", show_routes)
    menu.add("1", MenuItem.new("Создать маршрут", CreateRouteCommand(self)))
    menu.add("2", select_route)
    menu.add("0", parent_menu)
    menu
  end

  def select_route(parent_menu)
    menu = Menu.new("Выбрать маршрут", SelectRouteCommand.new(self))
    # выбрать маршрут
    menu.add("1", MenuItem.new("Добавить станцию", RouteIncludeStationCommand(self)))
    menu.add("2", MenuItem.new("Исключить станцию", RouteExcludeStationCommand(self)))
    menu.add("0", clear_selection_decorator(parent_menu))
    menu
  end

  def clear_selection_decorator(parent_menu)
    menu_decorator = MenuDecorator.new(parent_menu.title, ClearSelectionCommand.new(self))
    menu_decorator.set_menu = parent_menu
  end

end

application = Application.new()
application.run
