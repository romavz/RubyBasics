require_relative 'wagon'

class PassengerWagon < Wagon
  INVALID_CAPACITY_MESSAGE = 'Количество мест должно быть в пределах 1..100, задано: '
  ALL_SPACE_TAKEN_MESSAGE = 'Все места уже заняты'
  NOT_ENOUGH_SPACE_MESSAGE = 'Количесва свободных мест недостаточно'

  def properties
    @properties[:capacity] = "количество мест: #{capacity}"
    super
  end

  def take_a_space(seat_count = 1)
    raise ArgumentError, SEATS_COUNT_TO_MATCH if seat_count > 1
    super(seat_count)
  protected

  def max_capacity
    100
  end

end
