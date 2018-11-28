class PassengerWagon
  attr_reader :seat_count

  def initialize(number, seat_count)
    super(number)
    @seat_count = seat_count
    properties['количество мест'.freeze] = seat_count
  end
end
