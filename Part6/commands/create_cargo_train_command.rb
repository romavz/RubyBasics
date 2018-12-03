require_relative '../cargo_train'
require_relative 'create_train_command'

class CreateCargoTrainCommand < CreateTrainCommand

  protected

  def create_train(number, name)
    train = CargoTrain.new(number, name)
    train
  end
end
