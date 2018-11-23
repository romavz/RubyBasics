require_relative 'Train'

# Пассажирский поезд
class PassengerTrain < Train

  protected
  def is_allowed(wagon)
    wagon.is_a?(PassengerWagon)
end
