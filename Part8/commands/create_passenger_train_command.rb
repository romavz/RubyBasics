require_relative '../passenger_train'
require_relative 'create_train_command'

class CreatePassengerTrainCommand < CreateTrainCommand
  protected

  def create_train(number, name)
    train = PassengerTrain.new(number, name)
    train
  end
end
