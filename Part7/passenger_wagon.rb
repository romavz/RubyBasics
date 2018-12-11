require_relative 'wagon'

class PassengerWagon < Wagon
  INVALID_SEAT_COUNT_MESSAGE = 'Количество мест должно быть в пределах 0..100'
  ALL_SEATS_TAKEN_MESSAGE = 'Все места уже заняты'

  attr_reader :seat_count
  attr_reader :taken_seat_count

  def initialize(number, seat_count)
    @seat_count = seat_count.to_i
    @taken_seat_count = 0
    super(number)
    @properties << "количество мест: #{seat_count}"
  end

  def take_a_seat
    raise StandardError, ALL_SEATS_TAKEN_MESSAGE if free_seats_count == 0
    @taken_seat_count += 1
  end

  def free_seats_count
    seat_count - taken_seat_count
  end

  def properties
    @properties | ["свободно/занято: #{free_seats_count}/#{taken_seat_count}"]
  end

  protected

  def validate!
    super
    raise ArgumentError, INVALID_SEAT_COUNT_MESSAGE unless seat_count.between?(0, 100)
  end

end
