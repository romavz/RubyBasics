require_relative 'wagon'

class PassengerWagon < Wagon
  attr_reader :seat_count

  def initialize(number, seat_count)
    super(number)
    @seat_count = seat_count
    @properties << "количество мест: #{seat_count}"
  end

end
