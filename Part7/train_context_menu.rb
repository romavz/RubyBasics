require_relative './commands/wagon_load_command'
require_relative './commands/wagon_take_a_seat_command'
require_relative 'menu'
require_relative 'application'

class TrainContextMenu < Menu
  APPLICATION_NOT_DEFINED = 'Ссылка на приложение не задана'
  INVALID_ARGUMENT_TYPE = 'Неверный тип аргумента: application'

  attr_reader :application

  def initialize(title, command, application)
    super(title, command)
    raise ArgumentError, APPLICATION_NOT_DEFINED if application.nil?
    raise ArgumentError, INVALID_ARGUMENT_TYPE unless application.is_a?(Application)

    @application = application
    @context_menu = {}
    context_menu[CargoTrain] = MenuItem.new('Загрузить вагон', WagonLoadCommand.new(application))
    context_menu[PassengerTrain] = MenuItem.new('Занять место', WagonTakeASeatCommand.new(application))
  end

  def show_menu
    train_type = application.selected_objects[:train].class
    menu_items['7'] = context_menu[train_type]
    super
  end

  private

  attr_reader :context_menu

end
