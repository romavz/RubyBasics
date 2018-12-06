require_relative 'wagon'

class PassengerWagon < Wagon
  attr_reader :seat_count

  def initialize(number, seat_count)
    @seat_count = seat_count
    @properties << "количество мест: #{seat_count}"
    super(number)
  end

  protected

  def validate!
    super
    raise ArgumentError, 'Количество мест не задано' if seat_count.nil?
    invalid_seat_count_message = "Задано количество мест (#{seat_count}), должно быть в пределах 0..100"
    raise ArgumentError, invalid_seat_count_message unless seat_count.between?(0..100)
  end

end
