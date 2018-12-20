require_relative '../passenger_wagon'
require_relative 'wagon_create_strategy'

class PassengerWagonCreateStrategy < WagonCreateStrategy
  def create_wagon
    super
    print 'Введите количество мест: '
    seat_count = gets.to_i
    wagon = PassengerWagon.new(number, seat_count)
    wagon
  end
end
