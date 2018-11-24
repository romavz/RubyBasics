require_relative 'train'

# Пассажирский поезд
class PassengerTrain < Train

  protected
  
  def allowed_wagon?(wagon)
    wagon.is_a?(PassengerWagon)
end
