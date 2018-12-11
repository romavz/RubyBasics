require_relative 'wagon'

class PassengerWagon < Wagon
  INVALID_CAPACITY_MESSAGE = 'Количество мест должно быть в пределах 1..100, задано: '
  ALL_SPACE_TAKEN_MESSAGE = 'Все места уже заняты'
  NOT_ENOUGH_SPACE_MESSAGE = 'Количесва свободных мест недостаточно'

  def properties
    @properties[:capacity] = "количество мест: #{capacity}"
    super
  end

  protected

  def max_capacity
    100
  end

end
