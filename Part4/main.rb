
class Application

  attr_reader :stations
  attr_reader :routes
  attr_reader :trains
  attr_reader :wagons

  def initialize
    @stations = []
    @routes = []
    @trains = []
    @wagons = []

  def run
    menu = create_menu
    menu.activate
    loop do
      # запросить ID пункта меню
      # активировать пункт меню
    end
  end

  def create_menu
    menu.new(self)
    # TODO: Добавить пункты меню с привязкой команд
  end

end

application = Application.new()
application.run
