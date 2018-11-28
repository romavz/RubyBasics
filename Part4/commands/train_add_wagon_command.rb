require_relative '../train'
require_relative 'train_modify_command'
require_relative '../strategies/cargo_wagon_create_strategy'
require_relative '../strategies/passenger_wagon_create_strategy'

class TrainAddWagonCommand < TrainModifyCommand

  def initialize(application)
    super(application)
    @wagon_creators =
    {
      CargoTrain => CargoWagonCreateStrategy.new(),
      PassengerTrain => PassengerWagonCreateStrategy.new()
    }
  end

  protected

  def do_execute
    view_wagons
    wagon = wagon_creator.create_wagon
    train.add_wagon(wagon)
    view_wagons
  end

  private

  attr_reader :wagon_creators

  def wagon_creator
    return wagon_creators[train.class]
  end

end
