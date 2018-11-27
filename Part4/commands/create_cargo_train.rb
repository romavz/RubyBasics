require_relative './cargo_train'
require_relative 'create_train_command'

class CreatePassengerTrainCommand < Command

  protected

  def create_train(number, name)
    CartoTrain.new(number, name)
  end

end
