require_relative 'wagon'

class PassengerWagon < Wagon
  INVALID_SEAT_COUNT_MESSAGE = 'Количество мест должно быть в пределах 0..100'

  attr_reader :seat_count

  def initialize(number, seat_count)
    @seat_count = seat_count.to_i
    @properties << "количество мест: #{seat_count}"
    super(number)
  end

  protected

  def validate!
    super
    raise ArgumentError, INVALID_SEAT_COUNT_MESSAGE unless seat_count.between?(0, 100)
  end

end
