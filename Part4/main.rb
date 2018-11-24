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
      current_menu = current_menu[item_id]
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
    main_menu.add("0", MenuItem.new("Выход из программы", exit))
    main_menu
  end

  def stations_menu(parent_menu)
    show_stations = ShowStationsCommand.new(self)
    add_station = AddStationCommand.new(self)

    menu = Menu.new("Станции", show_stations)
    menu.add("1", MenuItem.new("Создать станцию", add_station))
    menu.add("0", parent_menu)
    menu
  end

  def trains_menu(parent_menu)
    show_trains = ShowTrainsCommand.new(self)
    trains_menu = Menu.new("Поезда", show_trains)
    trains_menu.add("1", MenuItem.new("Создать поезд", CreateTrainCommand(self)))
    trains_menu.add("2", select_train_menu(trains_menu))
    trains_menu.add("0", parent_menu)
    menu
  end

  def select_train_menu(parent_menu)
    menu = Menu.new("Выбрать поезд", SelectTrainCommand(self))
    menu.add("1", MenuItem.new("Назначить маршрут", SetRouteCommand.new(self)))
    menu.add("2", MenuItem.new("Прицепить вагон", AddWagonCommand.new(self)))
    menu.add("3", MenuItem.new("Отцепить вагон", UnhookWagon.new(self)))
    menu.add("4", MenuItem.new("Прибавить скорость", SpeedUpCommand.new(self)))
    menu.add("5", MenuItem.new("Сбросить скорость", SpeedDownCommand.new(self)))
    menu.add("6", MenuItem.new("Отправить на следующую станцию", GoNextStationCommand.new(self)))
    menu.add("7", MenuItem.new("Вернуть на предыдущую станцию", GoPrevStationCommand.new(self)))
    menu.add("0", parent_menu)
  end

  def routes_menu(parent_menu)
    show_routes = ShowRoutesCommand.new(self.routes)
    menu = Menu.new("Маршруты", show_routes)
    # создать маршрут
    # выбрать маршрут
      # добавить станцию
      # удалить станцию
      # 0.< возврат к списку маршрутов

    # 0. < возврат в главное меню
    menu.add("0", parent_menu)
    menu
  end

end

application = Application.new()
application.run
