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
    raise ArgumentError, "Количество мест не задано" if seat_count.nil?
    message = "Задано количество место (#{seat_count}), должно быть в пределах 0..100"
    raise ArgumentError, message unless (0..100).include?(seat_count)
  end

end
