require_relative 'train'

# Пассажирский поезд
class PassengerTrain < Train

  def type
    'Пассажирский'
  end

  protected

  def allowed_wagon?(wagon)
    wagon.is_a?(PassengerWagon) && super
  end

end
