require_relative '../cargo_train'
require_relative 'create_train_command'

class CreateCargoTrainCommand < Command
  protected

  def create_train(number, name)
    train = CartoTrain.new(number, name)
    train
  end
end
