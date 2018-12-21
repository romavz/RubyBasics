require_relative 'wagon'

class PassengerWagon < Wagon
  INVALID_CAPACITY_MESSAGE = 'Количество мест должно быть в пределах 1..100, задано: '.freeze
  ALL_SPACE_TAKEN_MESSAGE = 'Все места уже заняты'.freeze
  NOT_ENOUGH_SPACE_MESSAGE = 'Количесва свободных мест недостаточно'.freeze
  SEATS_COUNT_TOO_MUTCH = "Количесвто занимаемых мест за раз должно быть 1".freeze

  def properties
    @properties[:capacity] = "количество мест: #{capacity}"
    super
  end

  def take_a_space(seat_count)
    raise ArgumentError, SEATS_COUNT_TOO_MUTCH if seat_count != 1
    
    super(1)
  end

  protected

  def max_capacity
    100
  end
end
