require_relative './passenger_train'
require_relative 'create_train_command'

class CreatePassengerTrainCommand < CreateTrainCommand

  protected

  def create_train(number, name)
    PassengerTrain.new(number, name)
  end
  
end
